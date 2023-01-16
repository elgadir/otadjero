@extends('layouts.admin')

@section('title', "Appointment List")

@section('new_button')

    <span><a href="{{ route('inventory.items.appointment.add', ['inventory', 'items']) }}" class="btn btn-white btn-sm header-button-top">{{ trans('general.add_new') }}</a></span>
@endsection

@section('content')
    <div class="card">
        <div class="row">
            <div class=" col-md-6 ">
                 <div class="card-header border-bottom-0">
                  
               <select class="form-control" name="filter" id="filter" onChange="filterChange()">
               
                <option value="1" {{ request()->id == 1 ? "selected":"" }} > Upcoming</option>
                <option value="2" {{ request()->id == 2 ? "selected":"" }}> Past 30 days</option>
                <option value="3" {{ request()->id == 3 ? "selected":"" }}> Past Year</option>
                <option value="4" {{ request()->id == 4 ? "selected":"" }}> Lifetime</option>
                
              </select>
              </div>
            </div>
            <div class=" col-md-6 ">
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
            </div>
            
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
                    @forelse($appointmentList as $list)
                        <tr class="row align-items-center border-top-1">
                            <td class="col-md-2 border-0">
                                <a href="#">{{ $list->contacts->name }}</a>
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
                                <a href="{{ route('inventory.items.appointment.edit',['id'=>$list->id]) }}" class="btn btn-info">Edit</a>&nbsp;
                                <a href="{{ route('inventory.items.appointment.delete',['id'=>$list->id]) }}" class="btn btn-danger">Delete</a>  
                            </td>
                        </tr>
                        @empty
                        <tr class="row align-items-center border-top-1">
                            <td class="col-md-2 border-0" colspan="8">
                                No data found
                            </td>
                        </tr>
                        @endforelse
                </tbody>
            </table>
        </div>

         
    </div>
@endsection

@push('scripts_start')
<script type="text/javascript">
    function filterChange(){
        var current = document.getElementById("filter");
        var url = "{{ url()->current() }}";
        window.location.href = url+"?id="+current.options[current.selectedIndex].value;
    }
</script>
    <script src="{{ asset('modules/Inventory/Resources/assets/js/histories.min.js?v=' . module_version('inventory')) }}"></script>
@endpush
