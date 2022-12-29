<?php

namespace Modules\Inventory\Jobs\Warehouses;

use App\Abstracts\Job;
use App\Interfaces\Job\ShouldUpdate;
use Modules\Inventory\Models\Warehouse;

class UpdateWarehouse extends Job implements ShouldUpdate
{
    public function handle(): Warehouse
    {
        $this->authorize();

        \DB::transaction(function () {
            $this->model->update($this->request->all());

            $this->model->number_prefix = $this->request->number_prefix;
            $this->model->number_digit = $this->request->number_digit;
            $this->model->number_next = $this->request->number_next;
            $this->model->save();
            // Set default warehouse
            if ($this->request['default_warehouse']) {
                setting()->set('inventory.default_warehouse', $this->model->id);
                setting()->save();
            }
        });

        return $this->model;
    }

    /**
     * Determine if this action is applicable.
     *
     * @return void
     */
    public function authorize()
    {
        if (!$this->request->get('enabled') && ($this->model->id == setting('inventory.default_warehouse'))) {
            $relationships[] = strtolower(trans_choice('general.companies', 1));

            $message = trans('messages.warning.disabled', ['name' => $this->model->name, 'text' => implode(', ', $relationships)]);

            throw new \Exception($message);
        }
    }

    public function getRelationships()
    {
        $rels = [
            'transactions' => 'transactions',
        ];

        return $this->countRelationships($this->model, $rels);
    }
}
