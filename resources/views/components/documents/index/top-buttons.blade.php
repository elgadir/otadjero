@if ($checkPermissionCreate)
    @can($permissionCreate)
    <?php 
          
          $id = '';
          $roleid = \DB::table('user_roles')->where("user_id",auth()->id())->first();
          $data = '';            
          if($roleid->role_id != 1){
              $data = \DB::table("inventory_warehouses")->whereIn('id',\DB::table("inventory_user_warehouses")->where("user_id",auth()->id())->pluck("warehouse_id")->toArray())->whereNull('deleted_at')->get();
          }else{
              $data = \DB::table("inventory_warehouses")->whereNull('deleted_at')->get();
          }
          $current = explode("/",url()->current());
          $routeId = "";
          if(in_array("invoices",$current)  &&  isset($data[0])){
            $routeId = optional($data[0])->id;
            
          } 
          

          ?>
        @if (!$hideCreate)
            <a href="{{ route($createRoute) }}?war_id=<?php echo  $routeId; ?>" class="btn btn-success btn-sm">{{ trans('general.add_new') }}</a>
        @endif

        @if (!$hideImport)
            <a href="{{ route($importRoute, $importRouteParameters) }}" class="btn btn-white btn-sm">{{ trans('import.import') }}</a>
        @endif
    @endcan
@else
    @if (!$hideCreate)
        <a href="{{ route($createRoute) }}?war_id=<?php echo  $routeId; ?>" class="btn btn-success btn-sm">{{ trans('general.add_new') }}</a>
    @endif

    @if (!$hideImport)
        <a href="{{ route($importRoute, $importRouteParameters) }}" class="btn btn-white btn-sm">{{ trans('import.import') }}</a>
    @endif
@endif

@if (!$hideExport)
    <a href="{{ route($exportRoute, request()->input()) }}" class="btn btn-white btn-sm">{{ trans('general.export') }}</a>
@endif
