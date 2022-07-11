<?php

namespace App\Transformers\Common;

use App\Models\Item as Model;
use App\Transformers\Setting\Category;
use League\Fractal\TransformerAbstract;

class Item extends TransformerAbstract
{
    /**
     * @var array
     */
    protected $defaultIncludes = ['taxes', 'category'];

    /**
     * @param  Model $model
     * @return array
     */
    public function transform(Model $model)
    {
        return [
            'id' => $model->id,
            'company_id' => $model->company_id,
            'name' => $model->name,
            'description' => $model->description,
            'sale_price' => $model->sale_price,
            'sale_price_formatted' => money($model->sale_price, setting('default.currency'), true)->format(),
            'purchase_price' => $model->purchase_price,
            'purchase_price_formatted' => money($model->purchase_price, setting('default.currency'), true)->format(),
            'category_id' => $model->category_id,
            'tax_ids' => $model->tax_ids,
            'picture' => $this->getPicture($model->id),
            'enabled' => $model->enabled,
            'total_stock'=> $model->total_stock,
            'created_by' => $model->created_by,
            'created_at' => $model->created_at ? $model->created_at->toIso8601String() : '',
            'updated_at' => $model->updated_at ? $model->updated_at->toIso8601String() : '',
           // 'warehouses'=>$this->getWareHouses($model->id),
            //'warehouse_id'=>$model->id,
            'sku'=>$model->sku,
            'picture' => $this->getPicture($model->id),
            'item_data'=> $model->inventoryHistories,
        ];
    }

    /**
     * @param  Model $model
     * @return mixed
     */
    public function includeTaxes(Model $model)
    {
        if (!$model->taxes) {
            return $this->null();
        }

        return $this->collection($model->taxes, new ItemTax());
    }

    /**
     * @param  Model $model
     * @return mixed
     */
    public function includeCategory(Model $model)
    {
        if (!$model->category) {
            return $this->null();
        }

        return $this->item($model->category, new Category());
    }
    public function getWareHouses($id)
    {
        $data = \DB::table("inventory_items")->where("item_id",$id)->first();  
        if(isset($data->warehouse_id) && !empty($data->warehouse_id)){
                return \DB::table("inventory_warehouses")->where("id",$data->warehouse_id)->get();
        }
          return "";
        
    }
    public function getPicture($id){
		$cid = company_id();
		$item_id = $id;
		
		$sql = "SELECT media_id  FROM `kxm_mediables` WHERE company_id='$cid' AND mediable_id='$item_id' AND tag='picture' ";
		
		$data = \DB::table("media")->whereRaw("id IN($sql)")->first();
		if($data){
			return \Storage::url($data->id);
		}else{
			return asset('public/img/akaunting-logo-green.svg');
		}
	}

}
