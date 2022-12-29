<?php

namespace Modules\Inventory\Jobs\Warehouses;

use App\Abstracts\Job;
use App\Interfaces\Job\HasOwner;
use App\Interfaces\Job\HasSource;
use App\Interfaces\Job\ShouldCreate;
use Modules\Inventory\Models\Warehouse;

class CreateWarehouse extends Job implements HasOwner, HasSource, ShouldCreate
{
    public function handle(): Warehouse
    {
        \DB::transaction(function () {
            $this->model = Warehouse::create($this->request->all());
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
}
