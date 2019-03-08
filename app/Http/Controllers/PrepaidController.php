<?php

namespace App\Http\Controllers;

use App\Order;
use App\Prepaid;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
// use App\Http\Requests\UserStoreRequest;
use App\Jobs\CancelOrderJob;

class PrepaidController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $value = [10000,50000,100000];

      
        return view('prepaid.index',['value' => $value]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

                      
        

        //For validation
        prepaidValidationForm();
        //------------------------

        // $prepaid = new Prepaid;
        // $prepaid->value = $request->get('value');
        // $prepaid->mobile_number = $request->get('mobile_number');
        // $prepaid->price = $request->get('value');
        // $prepaid->save();


    try{    

        DB::beginTransaction();

        $prepaid = Prepaid::create([

            'value' => $request->get('value'),
            'mobile_number' => $request->get('mobile_number'),
            'price' => $request->get('value')

        ]);



        // if($prepaid->save()){ 
            
            $order = new Order;
            $order->user_id = \Auth::user()->id;
            $order->invoice_number = generateCode();
            $order->total_price = $request->get('value') + (($request->get('value') * 5) / 100); 
           
            $order->save();

            //---------Queue----------
            $job = (new CancelOrderJob())->delay(\Carbon\Carbon::now()->addMinutes(5));
            dispatch($job);
            //-------------------------

            $order->prepaids()->attach($prepaid->id);

            DB::commit();
            
            return redirect()->route('success.index',['id' => $order->id]);
            
            // }


    
        }catch(\Exception $e){
            DB::rollback();
    
            return $e->getMessage(); 
        }	
            


        
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Prepaid  $prepaid
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Prepaid  $prepaid
     * @return \Illuminate\Http\Response
     */
    public function edit(Prepaid $prepaid)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Prepaid  $prepaid
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Prepaid $prepaid)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Prepaid  $prepaid
     * @return \Illuminate\Http\Response
     */
    public function destroy(Prepaid $prepaid)
    {
        //
    }
}
