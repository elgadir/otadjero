@extends('layouts.admin')

@section('title', " Appointment Create")

@section('content')
    
    <form method="POST" action="{{ route('inventory.items.appointment.create') }}"  enctype="multipart/form-data" id="" novalidate> 
      @csrf
        <div class="card">
            <div class="card-body">
                <div class="row">

                        <div class="form-group col-md-12 ">
                           <label for="name" class="form-control-label">Client Name</label> 
                           <div class="input-group input-group-merge ">
                              <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-id-card"></i></span></div>
                              <input  placeholder="Enter Name" required="required" name="name" type="text" id="name" class="form-control" value="">
                           </div>
                           <!---->
                        </div>
                        <div class="form-group col-md-3">
                           <label for="enabled" class="form-control-label">Start Date</label> 
                            <div class="form-check">
                              <input type="date" class="form-check-input" id="radio1" name="start_date"  >
                            </div>
                           
                        </div>
                         <div class="form-group col-md-3">
                           <label for="enabled" class="form-control-label">Time</label> 
                          
                            <div class="form-check">
                              
                              <input type="time" class="form-check-input" id="radio2" name="start_time"   >
                            </div>
                           <!---->
                        </div>
                         <div class="form-group col-md-6"></div>
                        <br>
                        <div class="form-group col-md-12"></div>


                         <div class="form-group col-md-3">
                           <label for="enabled" class="form-control-label">End Date</label> 
                            <div class="form-check">
                              <input type="date" class="form-check-input" id="radio1" name="end_date" >
                            </div>
                           
                        </div>
                         <div class="form-group col-md-3">
                           <label for="enabled" class="form-control-label">Time</label> 
                          
                            <div class="form-check">
                              
                              <input type="time" class="form-check-input" id="radio2" name="end_time"  >
                            </div>
                           <!---->
                        </div>
                         <div class="form-group col-md-6"></div>
                        <br>
                        <div class="form-group col-md-12"></div>
                        
                         <div class="form-group col-md-6 ">
                           <label for="enabled" class="form-control-label">Location </label> 
                            <div class="form-check">
                             <select class="form-control" name="location">
                                @forelse ($warehouses as $warehouses_list)
                                <option value="{{$warehouses_list->id}}"> {{$warehouses_list->name}}</option>
                                @empty
                                    <option value="1"> No Warehouse found </option>
                                @endforelse
                              </select>
                            </div>
                          
                           <!---->
                        </div>
                        <div class="form-group col-md-12 " >
                            <label for="enabled" class="form-control-label">Attach Product&Service </label> 
                            <div class="form-check">
                              <input class="form-check-input" type="file"  name="file"  >
                               
                            </div>
                           <!---->
                        </div>
                     <div class="form-group col-md-12"></div>
                        <div class="form-group col-md-12">
                           <label for="description" class="form-control-label">Description</label> 
                           <textarea data-name="description" placeholder="Enter Description" rows="3" name="description" cols="50" id="description" class="form-control"></textarea>
                           <!---->
                        </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-footer">
                <div class="row save-buttons">
                    {{ Form::saveButtons('inventory.warehouses.index') }}
                </div>
            </div>
        </div>
    {!! Form::close() !!}

@endsection

@push('scripts_start')
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="{{ asset('modules/Inventory/Resources/assets/js/price_list.js?v=' . module_version('inventory')) }}"></script>
@endpush
