<?php

namespace Modules\Inventory\Http\Controllers;

use App\Models\Common\Item;
use App\Models\Setting\Tax;
use App\Models\Setting\Category;
use App\Models\Setting\Currency;
use App\Abstracts\Http\Controller;
use Modules\Inventory\Models\History;
use Modules\Inventory\Models\Variant;
use Modules\Inventory\Traits\Barcode;
use Modules\Inventory\Models\Warehouse;
use Modules\Inventory\Jobs\Items\CreateItem;
use Modules\Inventory\Jobs\Items\UpdateItem;
use App\Jobs\Common\UpdateItem as BaseUpdateItem;
use Illuminate\Notifications\DatabaseNotification;
use Illuminate\Http\Request as NotificationRequest;
use Modules\Inventory\Exports\Items\Items as Export;
use Modules\Inventory\Http\Requests\Item as Request;
use Modules\Inventory\Imports\Items\Items as Import;
use App\Http\Requests\Common\Import as ImportRequest;
use Modules\Inventory\Jobs\ItemGroups\CreateItemGroup;
use Modules\Inventory\Jobs\Items\DeleteItem as InventoryDeleteItem;
use Modules\Inventory\Exports\Show\Items\Histories as ExportHistories;

use Modules\Inventory\Models\PriceType;
use Modules\Inventory\Models\Appointment;
use Modules\Inventory\Models\CustomItemPrice;

use App\Models\Common\Contact;


class Items extends Controller
{
    use Barcode;

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $items = Item::with('category', 'media')->collect();

        return $this->response('inventory::items.index', compact('items'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $categories = Category::item()->enabled()->orderBy('name')->take(setting('default.select_limit'))->pluck('name', 'id');

        $taxes = Tax::enabled()->orderBy('name')->get()->pluck('title', 'id');

        $currency = Currency::where('code', setting('default.currency'))->first();

        $warehouses = Warehouse::enabled()->pluck('name', 'id');

        $variants = Variant::enabled()->orderBy('name')->pluck('name', 'id');

        foreach (json_decode(setting('inventory.units')) as $key => $value) {
            $units[$value] = $value;
        }

        return view('inventory::items.create', compact('units', 'categories', 'currency', 'warehouses', 'variants', 'taxes'));
    }

    public function store(Request $request)
    {
        
   
        if ($request->has('add_variants') == true && $request->get('add_variants') == 'true') {
            $request->merge(['items' => $request->group_items]);

            $response = $this->ajaxDispatch(new CreateItemGroup($request));
        } else {
            $response = $this->ajaxDispatch(new CreateItem($request));
        }

        if ($response['success']) {
            if (empty($request->get('track_inventory')) || $request->get('track_inventory') == 'false') {
                $response['redirect'] = route('inventory.items.index');
            } else {
                $response['redirect'] = route('inventory.items.show', $response['data']->id);
            }

            $message = trans('messages.success.added', ['type' => trans_choice('general.items', 1)]);

            flash($message)->success();
        } else {
            $response['redirect'] = route('inventory.items.create');

            $message = $response['message'];

            flash($message)->error()->important();
        }

        return response()->json($response);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Item  $item
     *
     * @return Response
     */
    public function edit(Item $item)
    {
        $categories = Category::item()->enabled()->orderBy('name')->take(setting('default.select_limit'))->pluck('name', 'id');

        if ($item->category && !$categories->has($item->category_id)) {
            $categories->put($item->category->id, $item->category->name);
        }

        $warehouses = Warehouse::enabled()->pluck('name', 'id');

        $inventory_items = $item->inventory()->get();

        $sku = null;

        if (!empty($inventory_items[0])) {
            $sku = $inventory_items[0]->sku;
        }

        $track_control = !empty($inventory_items[0]) ? true : false;

        $taxes = Tax::enabled()->orderBy('name')->get()->pluck('title', 'id');

        foreach (json_decode(setting('inventory.units')) as $key => $value) {
            $units[$value] = $value;
        }

        return view('inventory::items.edit', compact('units', 'categories', 'item', 'inventory_items', 'sku', 'warehouses', 'track_control', 'taxes'));
    }

    public function update(Item $item, Request $request)
    {
        $response = $this->ajaxDispatch(new UpdateItem($item, $request));

        if ($response['success']) {
            if (empty($request->get('track_inventory')) || $request->get('track_inventory') == 'false') {
                $response['redirect'] = route('inventory.items.index');
            } else {
                $response['redirect'] = route('inventory.items.show', $response['data']->id);
            }

            $message = trans('messages.success.updated', ['type' => $item->name]);

            flash($message)->success();
        } else {
            $response['redirect'] = route('inventory.items.edit', $item->id);

            $message = $response['message'];

            flash($message)->error()->important();
        }

        return response()->json($response);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Item $item
     *
     * @return Response
     */
    public function destroy(Item $item)
    {
        $response = $this->ajaxDispatch(new InventoryDeleteItem($item));

        $response['redirect'] = route('inventory.items.index');

        if ($response['success']) {
            $message = trans('messages.success.deleted', ['type' => $item->name]);

            flash($message)->success();
        } else {
            $message = $response['message'];

            flash($message)->error()->important();
        }

        return response()->json($response);
    }

    /**
     * Show the form for viewing the specified resource.
     *
     * @return Response
     */
    public function show(Item $item)
    {
        $item_histories = History::where('item_id', $item->id)->collect();

        $barcode = $this->getBarcode($item);

        return view('inventory::items.show', compact('item', 'item_histories', 'barcode'));
    }

    /**
     * Enable the specified resource.
     *
     * @param  Item $item
     *
     * @return Response
     */
    public function enable(Item $item)
    {
        $response = $this->ajaxDispatch(new BaseUpdateItem($item, request()->merge(['enabled' => 1])));

        if ($response['success']) {
            $response['message'] = trans('messages.success.enabled', ['type' => $item->name]);
        }

        return response()->json($response);
    }

    /**
     * Disable the specified resource.
     *
     * @param  Item $item
     *
     * @return Response
     */
    public function disable(Item $item)
    {
        $response = $this->ajaxDispatch(new BaseUpdateItem($item, request()->merge(['enabled' => 0])));

        if ($response['success']) {
            $response['message'] = trans('messages.success.disabled', ['type' => $item->name]);
        }

        return response()->json($response);
    }

    /**
     * Import the specified resource.
     *
     * @param  ImportRequest  $request
     *
     * @return Response
     */
    public function import(ImportRequest $request)
    {
        $response = $this->importExcel(new Import, $request, trans_choice('general.items', 2));

        if ($response['success']) {
            $response['redirect'] = route('inventory.items.index');

            flash($response['message'])->success();
        } else {
            $response['redirect'] = route('import.create', ['inventory', 'items']);

            flash($response['message'])->error()->important();
        }

        return response()->json($response);
    }

    /**
     * Export the specified resource.
     *
     * @return Response
     */
    public function export()
    {
        return $this->exportExcel(new Export, trans_choice('general.items', 2));
    }

    public function markRead(NotificationRequest $request)
    {
        $notification = DatabaseNotification::find($request->get('notification_id'));

        $notification->markAsRead();

        return redirect(route('notifications.index'));
    }

    public function markReadAll()
    {
        $notifications = DatabaseNotification::where('type', 'Modules\Inventory\Notifications\ItemReorderLevel')->get();
        
        foreach ($notifications as $notification) {
            $notification->markAsRead();
        }

        return redirect(route('notifications.index'));
    }

    /**
    * Export the specified resource.
    *
    * @return Response
    */
    public function exportHistory()
    {
        return $this->exportExcel(new ExportHistories, trans_choice('general.items', 1) . ' ' . trans_choice('inventory::general.histories', 2));
    }

    /**
    * Print the barcode.
    *
    * @param  Item $item
    *
    * @return Response
    */
    public function printBarcode(Item $item)
    {
        $barcode = $this->getBarcode($item);

        $view = view('inventory::partials.print_barcode.print_barcode', compact('item', 'barcode'));

        return mb_convert_encoding($view, 'HTML-ENTITIES', 'UTF-8');
    }
    /**
    * Price list
    *
    * @param  Item $item
    *
    * @return Response
    */
    public function priceList()
    {
        //\DB::enableQueryLog();
        $price_list = PriceType::orderBy('created_at','DESC');
        $search = request()->input();
        if(isset($search['search'])){
            $search = request()->input();
            $price_list = $price_list->where("name", 'like', "%".str_replace('"','',$search['search']).'%');
        }
        $price_list = $price_list->get();
        //dd(\DB::getQueryLog());
        return $this->response('inventory::pricelist.index', compact('price_list'));
    }

    /**
    * Price Add
    *
    * @param  Item $item
    *
    * @return Response
    */
    public function priceCreate()
    {
        if(request()->method() == "POST"){
            $request = request()->input();
            unset($request['_token']);
            $request['discount'] = isset($request['discount']) ? 1 : 0;

            if($request['price_type'] == "1"){
               $request['pricing_scheme'] = NULL;
               $request['discount'] = 0;
               $request['currency'] = "";
               $request['price_discount'] = NULL;
            }else{

                $request['markup'] = "";
            }
            PriceType::create($request);
            return redirect(route("inventory.items.price.list"))->with('success', 'Price type added ');;
        }
        $currencies = \App\Models\Setting\Currency::all();    
        return $this->response('inventory::items.create_price',compact('currencies'));

    }

    public function priceUpdate($id)
    {

        if(request()->method() == "POST"){

            $request = request()->input();
            unset($request['_token']);
            $request['discount'] = isset($request['discount']) ? 1 : 0;
            
            if($request['price_type'] == "1"){
               $request['pricing_scheme'] = NULL;
               $request['discount'] = 0;
               $request['currency'] = "";
               $request['price_discount'] = NULL;
            }else{

                $request['markup'] = "";
            }
                
            PriceType::where('id',$id)->update($request);
            return redirect(route('inventory.items.price.list'))->with('success', 'Price type updated ');
            
        }
        $data = PriceType::findOrFail($id);
        $item_list = Item::orderBy('created_at','DESC');
        $search = request()->input();
        if(isset($search['search'])){
            $search = request()->input();
            $item_list = $item_list->where("name", 'like', "%".str_replace('"','',$search['search']).'%');
        }
        $item_list = $item_list->get();
       
        $currencies = \App\Models\Setting\Currency::all();
        return $this->response('inventory::items.update_price_list',compact('data','currencies','item_list'));

    }

    public function priceCustomUpdate($id)
    {
        $data = request()->input();
        $rowdata = json_decode($data['rowdata'],true);
        

      
        $data['custom_price'] = array_filter($data['custom_price']);
        if(!empty($data['custom_price'])){
            foreach($data['custom_price'] AS $k=>$v){
                $item = Item::find($k);
                if($rowdata['price_type'] == 1){
                    /*$price = 0;
                    if($rowdata['markup'] == "markdown"){
                        $price = ($item['purchase_price'] - (($item['purchase_price']*$v)/100));
                    }else{
                        $price = ($item['purchase_price'] + (($item['purchase_price']*$v)/100));
                    }
                    Item::where("id",$k)->update(["purchase_price"=>$price]);*/
                }else{

                }

                if($rowdata['price_type'] == 2){
                    Item::where("id",$k)->update(["sale_price"=>$v]);
                }else{
                    //$item = Item::find($k);
                    //$purchase_price = ($item['purchase_price'] - (($item['purchase_price']*$v)/100));
                    //Item::where("id",$k)->update(["purchase_price"=>$purchase_price]);
                }
                
            }
        }
        return redirect(route('inventory.items.price.list'))->with('success', ' added ');

    }

    public function appointmentList()
    {
        $appointmentList = Appointment::orderBy('created_at','DESC');
        $search = request()->input();
        if(isset($search['search'])){
            $search = request()->input();
            $appointmentList = $appointmentList->where("name", 'like', "%".str_replace('"','',$search['search']).'%');
        }
        $appointmentList = $appointmentList->get();

        //dd(\DB::getQueryLog());
        return $this->response('inventory::appointment.index', compact('appointmentList'));
    }
    public function appointmentAdd()
    {
        $warehouses = \Modules\Inventory\Models\Warehouse::all();
        
        $currencies = \App\Models\Setting\Currency::all();

        $contact = Contact::all();

        return $this->response('inventory::items.appointment_add',compact('currencies','warehouses','contact'));

    }
    public function appointmentEdit($id)
    {   
        $data = Appointment::find($id);
        $warehouses = \Modules\Inventory\Models\Warehouse::all();
        
        $currencies = \App\Models\Setting\Currency::all();
         $contact = Contact::all();   
        return $this->response('inventory::items.appointment_add',compact('currencies','warehouses','data','contact'));

    }
     public function appointmentcreate($id=null)
    {
         $request = request()->input();
    
            
            $start_datetime = $request['start_date']." ".$request['start_time'];
            $end_datetime = $request['end_date']." ".$request['end_time'];
            $data = Appointment::firstOrNew(["id"=>$id]);
            //$data = new Appointment();
            
            $data->name = $request['name'];
            $data->location = $request['location'];
            $data->description = $request['description'];
            $data ->start_datetime = date('Y-m-d H:i:s', strtotime($start_datetime));
            $data ->end_datetime = date('Y-m-d H:i:s', strtotime($end_datetime));
            $data->save();

            return redirect(route("inventory.items.appointment.list"))->with('success', 'Appointment added/updated ');;

    }
}
