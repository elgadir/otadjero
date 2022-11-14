<?php

namespace Modules\Inventory\Models;

use App\Abstracts\Model;

class CustomItemPrice extends Model
{
    protected $table = 'inventory_custom_item_price';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['id', 'price_id', 'item_id', 'price', 'created_At','updated_at','deleted_at'];
}
