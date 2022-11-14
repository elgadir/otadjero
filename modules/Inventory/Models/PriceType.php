<?php

namespace Modules\Inventory\Models;

use App\Abstracts\Model;

class PriceType extends Model
{
    protected $table = 'inventory_price_type';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['id', 'name', 'transcation_type', 'price_type', 'description','markup','percentage','created_At','updated_at','pricing_scheme','currency','discount','price_discount'];
}
