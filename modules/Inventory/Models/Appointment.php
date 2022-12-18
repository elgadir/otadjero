<?php

namespace Modules\Inventory\Models;

use App\Abstracts\Model;

class Appointment extends Model
{
    protected $table = 'inventory_appointment';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['id', 'name', 'start_datetime', 'end_datetime', 'location','description','created_At','updated_at'];


    public function warehouse()
    {
        return $this->hasOne('Modules\Inventory\Models\Warehouse',"id","location");
    }

    public function contacts()
    {
        return $this->hasOne('App\Models\Common\Contact',"id","name");
    }


}
