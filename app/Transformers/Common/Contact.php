<?php

namespace App\Transformers\Common;

use App\Models\Common\Contact as Model;
use League\Fractal\TransformerAbstract;
use Carbon\Carbon;

class Contact extends TransformerAbstract
{
    /**
     * @param Model $model
     * @return array
     */
    public function transform(Model $model)
    {
        return [
            'id' => $model->id,
            'company_id' => $model->company_id,
            'user_id' => $model->user_id,
            'type' => $model->type,
            'name' => $model->name,
            'email' => $model->email,
            'tax_number' => $model->tax_number,
            'phone' => $model->phone,
            'address' => $model->address,
            'website' => $model->website,
            'currency_code' => $model->currency_code,
            'enabled' => $model->enabled,
            'date_of_birth' => $model->date_of_birth,
            'age' => Carbon::parse($model->date_of_birth)->diff(\Carbon\Carbon::now())->format('%y years'),// years, %m months and %d days
            'reference' => $model->reference,
            'created_by' => $model->created_by,
            'created_at' => $model->created_at ? $model->created_at->toIso8601String() : '',
            'updated_at' => $model->updated_at ? $model->updated_at->toIso8601String() : '',
            'city' => $model->city,
            'zip_code' => $model->zip_code,
            'state' => $model->state,
            'country' => $model->country,
            'reference' => $model->reference,
            'price_type_id'=>$model->price_type,
            'price_type'=>$model->getPriceDetail

        ];
    }
}
