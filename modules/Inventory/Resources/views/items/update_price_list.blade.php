@extends('layouts.admin')

@section('title', " New Price List")

@section('content')
    
    <form method="POST" action="{{ route('inventory.items.price.update',['id'=>$data['id']]) }}" id="price_list">
      @csrf
        <div class="card">
            <div class="card-body">
                <div class="row">

                     @if (\Session::has('success'))
                        <div class="col-md-12" >
                           <div class="alert alert-success">
                             <strong>Success!</strong> {!! \Session::get('success') !!}.
                           </div>
                        </div>
                     @endif
                     
                    
                        <div class="form-group col-md-6 required">
                           <label for="name" class="form-control-label">Name</label> 
                           <div class="input-group input-group-merge ">
                              <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-id-card"></i></span></div>
                              <input  placeholder="Enter Name" required="required" name="name" type="text" id="name" class="form-control" value="{{ isset($data['name']) ?$data['name']:''  }}">
                           </div>
                           <!---->
                        </div>
                        <div class="form-group col-md-6">
                           <label for="enabled" class="form-control-label">Transcation Type</label> 
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="radio1" name="transcation_type" value="sales"   {{ (isset($data['transcation_type']) && $data['transcation_type'] == 'sales' ? 'checked':'' ) }}>
                              <label class="form-check-label" for="radio1">Sales</label>
                            </div>
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="radio2" name="transcation_type" value="purchase"  {{ (isset($data['transcation_type']) && $data['transcation_type'] == 'purchase' ? 'checked':'' ) }}>
                              <label class="form-check-label" for="radio2">Purchase</label>
                            </div>
                           <!---->
                        </div>
                        <div class="form-group col-md-12">
                           <label for="enabled" class="form-control-label">Price List Type</label> 
                            <div class="form-check">
                              <input type="radio" class="form-check-input priceList" id="allItems" data-id="1" name="price_type" value="1" {{ (isset($data['price_type']) && $data['price_type'] == 1 ? 'checked':'' ) }}>
                              <label class="form-check-label" for="radio3">All Items  (Mark up or mark down the rate of all items)</label>
                            </div>
                            <div class="form-check">
                              <input type="radio" class="form-check-input priceList" data-id="2" id="individualItems" name="price_type" value="2" {{ (isset($data['price_type']) && $data['price_type'] == 2 ? 'checked':'' ) }}> 
                              <label class="form-check-label" for="radio4">Individual Items  (Custimize the rate of item of each individually)</label>
                            </div>
                           <!---->
                        </div>
                     
                        <div class="form-group col-md-12">
                           <label for="description" class="form-control-label">Description</label> 
                           <textarea data-name="description" placeholder="Enter Description" rows="3" name="description" cols="50" id="description" class="form-control">{{ isset($data['description']) ?$data['description']:''  }}</textarea>
                           <!---->
                        </div>

                        <div class="form-group col-md-6 pricing_scheme" style="{{ $data['price_type'] == 2 ? : 'display: none;' }}">
                           <label for="enabled" class="form-control-label">Pricing Scheme </label> 
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="unit_price" name="pricing_scheme" value="1" {{ (isset($data['pricing_scheme']) && $data['pricing_scheme'] == 1 ? 'checked':'' ) }}>
                              <label class="form-check-label" for="radio1">Unit Pricing</label>
                            </div>
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="volume_pricing" name="pricing_scheme" value="2" {{ (isset($data['pricing_scheme']) && $data['pricing_scheme'] == 2 ? 'checked':'' ) }}>
                              <label class="form-check-label" for="radio2">Volume Pricing</label>
                            </div>
                           <!---->
                        </div>

                         <div class="form-group col-md-6 pricing_scheme" style="{{ $data['price_type'] == 2 ? : 'display: none;' }}">
                            <label for="enabled" class="form-control-label">Discount: </label> 
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" id="check1" name="discount" value="{{ $data['discount'] }}"  checked="{{ $data['discount']==1 ? 'checked':'' }}">
                                <label for="description" class="form-control-label">I want to include the discount percentage for the items</label> 
                            </div>
                           <!---->
                        </div>
                        <div class="form-group col-md-6 pricing_scheme" style="{{ $data['price_type'] == 2 ? : 'display: none;' }}">
                           <label for="enabled" class="form-control-label">Pricing Discount/Number </label> 
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="price_discount" name="price_discount" value="1" checked>
                              <label class="form-check-label" for="radio1">Discounted Price</label>
                            </div>
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="price_discount1" name="price_discount" value="2" >
                              <label class="form-check-label" for="radio2">Pricing in number</label>
                            </div>
                           <!---->
                        </div>
                        <div class="form-group col-md-6 pricing_scheme" style="{{ $data['price_type'] == 2 ? : 'display: none;' }}">
                           <label for="enabled" class="form-control-label">Currencies List </label> 
                            <div class="form-check">
                              <select class="form-select" name="currency">
                                  @foreach($currencies AS $k)
                                    <option value="{{ $k->code }}" {{ $k->code ==$data['currency'] ? "selected":""  }} >{{ $k->code }}-{{ $k->name }}</option>
                                  @endforeach
                                </select>
                            </div>
                            
                           <!---->
                        </div>


                        <div class="form-group col-md-12 percentage" style="{{ $data['price_type'] == 2 ? 'display: none;':'' }}">
                           <label for="enabled" class="form-control-label">Percentage </label> 
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="radio5" name="markup" value="markup" {{ (isset($data['markup']) && $data['markup'] == "markup" ? 'checked':'' ) }}>
                              <label class="form-check-label" for="radio5">Markup</label>
                            </div>
                            <div class="form-check">
                              <input type="radio" class="form-check-input" id="radio6" name="markup" value="markdown"  {{ (isset($data['markup']) && $data['markup'] == "markdown" ? 'checked':'' ) }}>
                              <label class="form-check-label" for="radio6">Markdown</label>
                            </div>
                            <div class="input-group input-group-merge ">
                              <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-id-card"></i></span></div>
                              <input placeholder="%" required="required" name="percentage" type="text" id="percentage" class="form-control" value="{{ isset($data['percentage']) ? $data['percentage']:''  }}">
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

            {!! Form::close() !!}
        </div>

         <form method="POST" action="{{ route('inventory.items.price.custom.update',['id'=>$data['id']]) }}" id="price_list1">
            @csrf
            <div class="table-responsive">
                <table class="table table-flush table-hover" >
                    <thead class="thead-light">
                        <tr class="row table-head-line">
                            <th class="col-md-2">Item Details</th>
                            <th class="col-md-2">Sale Rate</th>
                            <th class="col-md-2">Purchase Rate</th>
                            <th class="col-md-3">Custom Rate</th>
                            <th class="col-md-3">Currency</th>
                        </tr>
                    </thead>
                    <input type="hidden" name="rowdata" value="{{ json_encode($data) }}" >

                    <tbody>
                        @foreach($item_list as $k=>$list)
                            <tr class="row align-items-center border-top-1">
                                <td class="col-md-2 border-0">
                                    <a href="#">{{ $list->name." , ".$list->description }}</a>
                                </td>
                                <td class="col-md-2 border-0 ">
                                    <a href="#">{{ $list->sale_price }}</a>
                                </td>
                                <td class="col-md-2 border-0">
                                   <a href="#">{{ $list->purchase_price }}</a>
                                </td>
                                <td class="col-md-3">

                                    <input type="number" name="custom_price[{{$list->id}}]" value="">
                                    <input type="submit" name="save" value="Submit">
                                </td>
                                <td class="col-md-3">
                                    <label for="enabled" class="form-control-label">Currencies List </label> 
                                        <div class="form-check">
                                          <select class="form-select" name="currency">
                                              @foreach($currencies AS $k)
                                                <option value="{{ $k->code }}">{{ $k->code }}</option>
                                              @endforeach
                                            </select>
                                        </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </form>
         
    </div>

@endsection

@push('scripts_start')
<script src="{{ asset('modules/Inventory/Resources/assets/js/histories.min.js?v=' . module_version('inventory')) }}"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="{{ asset('modules/Inventory/Resources/assets/js/price_list.js?v=' . module_version('inventory')) }}"></script>
@endpush
