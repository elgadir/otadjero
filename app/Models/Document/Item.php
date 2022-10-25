<?php

namespace App\Models\Document;

use App\Abstracts\Model;
use Bkwld\Cloner\Cloneable;
//use Modules\Inventory\Database\Factories\Item as ItemFactory;
//use Illuminate\Database\Eloquent\Factories\HasFactory;

class Item extends Model
{


    protected $table = 'inventory_items';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = [
        'company_id',
        'default_warehouse',
        'item_id',
        'sku',
        'unit',
        'opening_stock',
        'opening_stock_value',
        'reorder_level',
        'vendor_id',
        'warehouse_id',
        'returnable',
        'barcode',
        'created_from',
        'created_by'];

}
