<div class="row">
    <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
        @if (!$hideContact)
        <div class="row">
            <x-select-contact-card
                type="{{ $contactType }}"
                :contact="$contact"
                :contacts="$contacts"
                :search-route="$contactSearchRoute"
                :create-route="$contactCreateRoute"
                error="form.errors.get('contact_name')"
                :text-add-contact="$textAddContact"
                :text-create-new-contact="$textCreateNewContact"
                :text-edit-contact="$textEditContact"
                :text-contact-info="$textContactInfo"
                :text-choose-different-contact="$textChooseDifferentContact"
            />
        </div>
        @endif
    </div>
    <?php 
          
          $id = '';
          $roleid = \DB::table('user_roles')->where("user_id",auth()->id())->first();
          $data = '';            
          if($roleid->role_id != 1){
              $data = \DB::table("inventory_warehouses")->whereIn('id',\DB::table("inventory_user_warehouses")->where("user_id",auth()->id())->pluck("warehouse_id")->toArray())->whereNull('deleted_at')->get();
          }else{
              $data = \DB::table("inventory_warehouses")->whereNull('deleted_at')->get();
          }
           
          

          ?>
         
    <?php
        $current = explode("/",url()->current());
       
        $docNumber = $documentNumber;
        //$ab = optional($document)->w_id ? optional($document)->w_id : request()->input("war_id");
        
        if(optional($document)->w_id){
            $selectedWarehouse = optional($document)->w_id;
        }
        if(request()->input("war_id")){
            $selectedWarehouse = request()->input("war_id");
        }else{
            $selectedWarehouse  = optional($data[0])->id ?? 1;

        }
        
        if((request()->input("war_id") || request()->input("document_id")) && in_array("invoices",$current)){
            $war_id = request()->input("war_id");
            if(request()->input("document_id")){
                $getDocument = \DB::table("documents")->where("id",request()->input("document_id"))->first();
               
                $war_id = $getDocument->w_id;
            }
           
            $doc = \DB::table("inventory_warehouses")->where("id",$war_id)->first();
            $ab = $war_id;
            

            $prefix = $doc->number_prefix;
            $next = $doc->number_next+1;  //($document == false ) ? $docNumber :
            $digit = $doc->number_digit;
    
            $a =  $prefix . str_pad($next, $digit, '0', STR_PAD_LEFT);
            $docNumber = $a;  
            
        }
      

        
    ?>
    

    <div class="col-sm-6 col-md-6 col-lg-6 col-xl-6">
        <div class="row">
            
            @if (!$hideIssuedAt)
            {{ Form::dateGroup('issued_at', trans($textIssuedAt), 'calendar', ['id' => 'issued_at', 'class' => 'form-control datepicker', 'required' => 'required', 'show-date-format' => company_date_format(), 'date-format' => 'Y-m-d', 'autocomplete' => 'off', 'change' => 'setDueMinDate'], $issuedAt) }}
            @endif

            @if (!$hideDocumentNumber)
            {{ Form::textGroup('document_number', trans($textDocumentNumber), 'file', ['required' => 'required'], $docNumber) }}
            @endif
            

            @if (!$hideDueAt)
                @if ($type == 'invoice')
                    {{ Form::dateGroup('due_at', trans($textDueAt), 'calendar', ['id' => 'due_at', 'class' => 'form-control datepicker', 'required' => 'required', 'show-date-format' => company_date_format(), 'period' => setting('invoice.payment_terms'), 'date-format' => 'Y-m-d', 'autocomplete' => 'off', 'min-date' => 'form.issued_at', 'min-date-dynamic' => 'min_due_date', 'data-value-min' => true], $dueAt) }}
                @else
                    {{ Form::dateGroup('due_at', trans($textDueAt), 'calendar', ['id' => 'due_at', 'class' => 'form-control datepicker', 'required' => 'required', 'show-date-format' => company_date_format(), 'date-format' => 'Y-m-d', 'autocomplete' => 'off', 'min-date' => 'form.issued_at', 'min-date-dynamic' => 'min_due_date', 'data-value-min' => true], $dueAt) }}
                @endif
            @else
            {{ Form::hidden('due_at', old('issued_at', $issuedAt), ['id' => 'due_at', 'v-model' => 'form.issued_at']) }}
            @endif

            @if (!$hideOrderNumber)
            {{ Form::textGroup('order_number', trans($textOrderNumber), 'shopping-cart', [], $orderNumber) }}
            @endif

           

                     
            <div style="display:none">{{ Form::selectGroup('warehouse_id', "Warehouses List", 'fa fa-warehouse', $data, $selectedWarehouse) }}
                </div> 
 

             <div class=" col-md-6">
               <label for="order_number" class="form-control-label">Warehouses List</label> 
               <div class="input-group input-group-merge ">
                  <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-warehouse"></i></span></div>
                  <select  name="w_id" id="w_id"  onchange="addID()" class="form-control" >
                  
                    @forelse ($data as $warehouses)
                        @php
                        if($loop->first)
                            $id = $warehouses->id
                        @endphp                      
                     <option value="{{ $warehouses->id }}" {{ $selectedWarehouse == $warehouses->id ?"selected":""  }} >{{ $warehouses->name }}</option>
                      @empty
                            <option>No warehouses found</option>
                      @endforelse
                  </select>

               </div>
               <!---->
            </div>
            

             <script type="text/javascript">
                document.cookie='w_idss='+@php echo $id @endphp;
                function addID(){
                    var current ="{{ url()->current() }}"                   
                    document.cookie='w_idss='+document.getElementById("w_id").value;
                    console.log("document.cookie",document.cookie); 
                    window.location.href=current+"?war_id="+document.getElementById("w_id").value;
                }
            </script>
           


        </div>
    </div>
</div>
