@extends('layouts.admin')

@section('title', " New Price List")

@section('content')
    
    <form method="POST" action="{{ route('inventory.items.price.create') }}" id="price_list" novalidate> 
      @csrf
        <div class="card">
            <div class="card-body">
                <div class="row">

                    
                     
                    
                        <div class="form-group col-md-6 required">
                           <label for="name" class="form-control-label">Name</label> 
                           <div class="input-group input-group-merge ">
                              <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-id-card"></i></span></div>
                              <input  placeholder="Enter Name" required="required" name="name" type="text" id="name" class="form-control" value="">
                           </div>
                           <!---->
                        </div>
                        <div class="form-group col-md-6">
                           <label for="enabled" class="form-control-label">Transcation Type</label> 
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="radio1" name="transcation_type" value="sales"   checked>
                              <label class="form-check-label" for="radio1">Sales</label>
                            </div>
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="radio2" name="transcation_type" value="purchase"  >
                              <label class="form-check-label" for="radio2">Purchase</label>
                            </div>
                           <!---->
                        </div>
                        <div class="form-group col-md-12">
                           <label for="enabled" class="form-control-label">Price List Type</label> 
                            <div class="form-check">
                              <input type="radio" class="form-check-input priceList" id="allItems" data-id="1" name="price_type" value="1" checked>
                              <label class="form-check-label" for="radio3">All Items  (Mark up or mark down the rate of all items)</label>
                            </div>
                            <div class="form-check">
                              <input type="radio" class="form-check-input priceList" data-id="2" id="individualItems" name="price_type" value="2" > 
                              <label class="form-check-label" for="radio4">Individual Items  (Custimize the rate of item of each individually)</label>
                            </div>
                           <!---->
                        </div>
                     
                        <div class="form-group col-md-12">
                           <label for="description" class="form-control-label">Description</label> 
                           <textarea data-name="description" placeholder="Enter Description" rows="3" name="description" cols="50" id="description" class="form-control"></textarea>
                           <!---->
                        </div>

                        <div class="form-group col-md-4 pricing_scheme" style="display: none;">
                           <label for="enabled" class="form-control-label">Pricing Scheme </label> 
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="unit_price" name="pricing_scheme" value="1" checked>
                              <label class="form-check-label" for="radio1">Unit Pricing</label>
                            </div>
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="volume_pricing" name="pricing_scheme" value="2" >
                              <label class="form-check-label" for="radio2">Volume Pricing</label>
                            </div>
                           <!---->
                        </div>

                         

                        <div class="form-group col-md-8 pricing_scheme" style="display: none;">
                            <label for="enabled" class="form-control-label">Discount: </label> 
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" id="check1" name="discount" value="1" >
                                <label for="description" class="form-control-label">I want to include the discount percentage for the items</label> 
                            </div>
                           <!---->
                        </div>
                        <div class="form-group col-md-6 pricing_scheme" style="display: none;">
                           <label for="enabled" class="form-control-label">Currencies List </label> 
                            <div class="form-check">
                              <select class="form-select" name="currency">
                                  @foreach($currencies AS $k)
                                  <option value="{{ $k->code }}-{{ $k->name }}">{{ $k->code }}-{{ $k->name }}</option>
                                  @endforeach
                                </select>
                            </div>
                            
                           <!---->
                        </div>


                        <div class="form-group col-md-12 percentage">
                           <label for="enabled" class="form-control-label">Percentage </label> 
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="radio5" name="markup" value="markup" checked>
                              <label class="form-check-label" for="radio5">Markup</label>
                            </div>
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="radio6" name="markup" value="markdown"  >
                              <label class="form-check-label" for="radio6">Markdown</label>
                            </div>
                            <div class="input-group input-group-merge ">
                              <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-id-card"></i></span></div>
                              <input placeholder="%" required="required" name="percentage" type="text" id="percentage" class="form-control" value="">
                           </div>
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
