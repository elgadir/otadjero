@extends('layouts.admin')

@section('title', "Price List")

@section('new_button')

    <span><a href="{{ route('inventory.items.price.create', ['inventory', 'items']) }}" class="btn btn-white btn-sm header-button-top">{{ trans('general.add_new') }}</a></span>
@endsection

@section('content')
    <div class="card">
        <div class="card-header border-bottom-0" :class="[{'bg-gradient-primary': bulk_action.show}]">
            {!! Form::open([
                'method' => 'GET',
                'route' => 'inventory.histories.index',
                'role' => 'form',
                'class' => 'mb-0'
            ]) !!}
                <div class="align-items-center" v-if="!bulk_action.show">
                    <x-search-string model="Modules\Inventory\Models\PriceType" />
                </div>

                {{ Form::bulkActionRowGroup('inventory::general.warehouses', $bulk_actions, ['group' => 'inventory', 'type' => 'histories']) }}
            {!! Form::close() !!}
        </div>

        @if (\Session::has('success'))
                        <div class="col-md-12" >
                           <div class="alert alert-success">
                             <strong>Success!</strong> {!! \Session::get('success') !!}.
                           </div>
                        </div>
                     @endif

        <div class="table-responsive">
            <table class="table table-flush table-hover" >
                <thead class="thead-light">
                    <tr class="row table-head-line">
                        <th class="col-md-2">Name and description</th>
                        <th class="col-md-3">Transaction Type</th>
                        <th class="col-md-3">Price List type</th>
                        <th class="col-md-2">Details</th>
                        <th class="col-md-2">Action</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach($price_list as $list)
                        <tr class="row align-items-center border-top-1">
                            <td class="col-md-2 border-0">
                                <a href="#">{{ $list->name." ".$list->description }}</a>
                            </td>
                            <td class="col-md-3 ">
                                <a href="#">{{ $list->transcation_type }}</a>
                            </td>
                            <td class="col-md-3">
                                <a href="#">{{ $list->price_type == 1 ? "All Items" : "Individual Items"  }}</a>
                            </td>
                            <td class="col-md-2 border-0">
                                {{ $list->percentage }} {{ $list->markup == 1 ? "Markup":"Markdown" }}
                            </td>
                            <td class="col-md-2 border-0">
                                <a href="{{ route('inventory.items.price.update',['id'=>$list->id]) }}">Edit</a> 
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

         
    </div>
@endsection

@push('scripts_start')
    <script src="{{ asset('modules/Inventory/Resources/assets/js/histories.min.js?v=' . module_version('inventory')) }}"></script>
@endpush
