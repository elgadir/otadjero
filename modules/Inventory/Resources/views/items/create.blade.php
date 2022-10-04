@extends('layouts.admin')

@section('title', trans('general.title.new', ['type' => trans_choice('general.items', 1)]))

@section('content')
    <div class="card">
        {!! Form::open([
            'route' => 'inventory.items.store',
            'id' => 'item',
            '@submit.prevent' => 'onSubmit',
            '@keydown' => 'form.errors.clear($event.target.name)',
            'files' => true,
            'role' => 'form',
            'class' => 'form-loading-button',
            'novalidate' => true
        ]) !!}

            <div class="card-body">
                <div class="row">
                    {{ Form::textGroup('name', trans('general.name'), 'tag') }}

                    {{ Form::selectRemoteAddNewGroup('category_id', trans_choice('general.categories', 1), 'folder', $categories, null, ['path' => route('modals.categories.create') . '?type=item', 'remote_action' => route('categories.index'). '?search=type:item']) }}

                    {{ Form::multiSelectAddNewGroup('tax_ids', trans_choice('general.taxes', 1), 'percentage', $taxes, (setting('default.tax')) ? [setting('default.tax')] : null, ['path' => route('modals.taxes.create'), 'field' => ['key' => 'id', 'value' => 'title']], 'col-md-6 el-select-tags-pl-38') }}

                    {{ Form::textareaGroup('description', trans('general.description')) }}

                    {{ Form::textGroup('sale_price', trans('items.sales_price'), 'money-bill-wave', ['required' => 'required', 'show' => 'form.add_variants == false']) }}
 <?php 

                                 $role_id = \DB::table('user_roles')->where("user_id",auth()->id())->first();
                                 
                                 $status = true;
                                 //if($role_id->role_id == 2){
                                    $data = \DB::table('role_permissions')
                                        ->where("role_id",$role_id->role_id)
                                        ->where("permission_id",279)
                                        ->first();
                                   
                                    if($data == null  ){
                                        $status = false;
                                    }
                                 //}
                                 if($status){
                                 ?>
                    {{ Form::textGroup('purchase_price', trans('items.purchase_price'), 'money-bill-wave-alt', ['required' => 'required', 'show' => 'form.add_variants == false']) }}
                <?php } else{?>
                    <input type='hidden' name='purchase_price' value="0" >
                <?php } ?>
                    {{ Form::selectGroup('unit', trans('inventory::general.unit'), 'fas fa-box-open', $units, old('default_unit', setting('inventory.default_unit')), ['required' => 'required', 'show' => 'form.track_inventory == true']) }}

                    {{ Form::textGroup('sku', trans('inventory::general.sku'), 'fa fa-key', ['required' => 'required', 'show' => 'form.track_inventory == true && form.add_variants == false'], !empty($inventory_item->sku) ? $inventory_item->sku : '', 'col-md-6') }}

                    {{ Form::textGroup('barcode', trans('inventory::general.barcode'), 'barcode', ['show' => 'form.track_inventory == true && form.add_variants == false']) }}

                    {{ Form::fileGroup('picture', trans_choice('general.pictures', 1), 'plus', ['dropzone-class' => 'form-file', 'options' => ['acceptedFiles' => 'image/*']]) }}

                    {{ Form::radioGroup('enabled', trans('general.enabled'), true) }}

                    <div class="row col-md-12">
                        <div class="form-group col-md-12 margin-top">
                            <div class="custom-control custom-checkbox">
                                {{ Form::checkbox('returnable', '1', null, [
                                    'class' => 'custom-control-input',
                                    'id' => 'returnable',
                                    '@input' => 'onCanReturnable($event)'
                                 ]) }}

                                <label class="custom-control-label" for="returnable">
                                    <strong>{{ trans('inventory::general.returnable') }}</strong>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div id="track_inventories" class="row col-md-12">
                        @stack('track_inventory_input_start')
                            <div id="item-track-inventory" class="form-group col-md-12 margin-top">
                                <div class="custom-control custom-checkbox">
                                    {{ Form::checkbox('track_inventory', true, setting('inventory.track_inventory'), [
                                        'v-model' => 'form.track_inventory',
                                        'id' => 'track_inventory',
                                        'class' => 'custom-control-input',
                                        '@input' => 'onCanTrack($event)'
                                    ]) }}

                                    <label class="custom-control-label" for="track_inventory">
                                        <strong>{{ trans('inventory::items.track_inventory')}}</strong>
                                    </label>
                                </div>
                            </div>
                        @stack('track_inventory_input_end')
                    </div>

                    <div id="add-variants" class="form-group col-md-12 margin-top" v-if="form.track_inventory == true">
                        <div class="custom-control custom-checkbox">
                            {{ Form::checkbox('add_variants', '1', null, [
                                'v-model' => 'form.add_variants',
                                'id' => 'add_variants',
                                'class' => 'custom-control-input',
                                '@input' => 'onCanVariants($event)'
                            ]) }}

                            <label class="custom-control-label" for="add_variants">
                                <strong>{{ trans('inventory::items.add_variants') }}</strong>
                            </label>
                        </div>
                    </div>

                    <div v-if="form.track_inventory == true" class="col-md-12">
                        <div v-if="form.add_variants == false">
                            @include('inventory::items.item')
                        </div>

                        <div v-if="form.add_variants == true">
                            @include('inventory::items.group')
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-footer">
                <div class="row save-buttons">
                    {{ Form::saveButtons('inventory.items.index') }}
                </div>
            </div>
        {!! Form::close() !!}
    </div>
@endsection

@push('scripts_start')
    <script type="text/javascript">
        var barcode_type = '{{ setting('inventory.barcode_type') }}'
    </script>
    <script src="{{ asset('modules/Inventory/Resources/assets/js/items.min.js?v=' . module_version('inventory')) }}"></script>
@endpush
