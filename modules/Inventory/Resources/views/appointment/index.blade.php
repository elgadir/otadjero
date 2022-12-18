@extends('layouts.admin')

@section('title', "Appointment List")

@section('new_button')

    <span><a href="{{ route('inventory.items.appointment.add', ['inventory', 'items']) }}" class="btn btn-white btn-sm header-button-top">{{ trans('general.add_new') }}</a></span>
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
                        <th class="col-md-2">Client Name</th>
                        <th class="col-md-2">Start DateTime</th>
                        <th class="col-md-2">End DateTime</th>
                        <th class="col-md-2">Location</th>
                        <th class="col-md-2">Description</th>
                        <th class="col-md-2">Action</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach($appointmentList as $list)
                        <tr class="row align-items-center border-top-1">
                            <td class="col-md-2 border-0">
                                <a href="#">{{ $list->name }}</a>
                            </td>
                            <td class="col-md-2 ">
                                <a href="#">{{ $list->start_datetime }}</a>
                            </td>
                             <td class="col-md-2 ">
                                <a href="#">{{ $list->end_datetime }}</a>
                            </td>
                            <td class="col-md-2">
                                <a href="#">{{ $list->warehouse->name }}</a>
                            </td>
                            <td class="col-md-2">
                                <a href="#">{{ $list->description }}</a>
                            </td>
                           
                            <td class="col-md-2 border-0">
                                <a href="{{ route('inventory.items.appointment.edit',['id'=>$list->id]) }}">Edit</a> 
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
