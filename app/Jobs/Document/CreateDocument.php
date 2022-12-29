<?php

namespace App\Jobs\Document;

use App\Abstracts\Job;
use App\Events\Document\DocumentCreated;
use App\Events\Document\DocumentCreating;
use App\Interfaces\Job\HasOwner;
use App\Interfaces\Job\HasSource;
use App\Interfaces\Job\ShouldCreate;
use App\Jobs\Document\CreateDocumentItemsAndTotals;
use App\Models\Document\Document;
use Illuminate\Support\Str;

class CreateDocument extends Job implements HasOwner, HasSource, ShouldCreate
{
    public function handle(): Document
    {
        
        if (empty($this->request['amount'])) {
            $this->request['amount'] = 0;
        }
        
        event(new DocumentCreating($this->request));

        \DB::transaction(function () {
            $data = $this->request->all();
            $id = $data['warehouse_id']; //(int)isset($_COOKIE['w_idss']) ? $_COOKIE['w_idss'] : 2;
            info($data);
            
            $this->model = Document::create($data);
            \DB::table("documents")->where("id",$this->model->id)->update(['w_id'=>$id,'enabled'=>$data['enabled']]);
           

            // Upload attachment
            if ($this->request->file('attachment')) {
                foreach ($this->request->file('attachment') as $attachment) {
                    $media = $this->getMedia($attachment, Str::plural($this->model->type));

                    $this->model->attachMedia($media, 'attachment');
                }
            }

            $this->dispatch(new CreateDocumentItemsAndTotals($this->model, $this->request));

            $this->model->update($this->request->all());

            $this->model->createRecurring($this->request->all());
        });

        event(new DocumentCreated($this->model, $this->request));

        $total_amt = 0;
        if((int)$this->request['enabled']){
            $total_amt = $this->request['amount'];
            if($this->request['amount'] <= 500){
                $total_amt += 5;
            }else{
               $percentAmnt = ($total_amt*1)/100;
                if($percentAmnt <= 2500) {
                    $total_amt += $percentAmnt;
                }else{
                    $total_amt += 2500;
                }
            }
            Document::where(['id' => $this->model->id])->update(["amount"=>$total_amt]);
            
        }

        return $this->model;
    }
}
