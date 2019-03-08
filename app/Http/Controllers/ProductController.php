<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Product;
use App\Order;
use App\Jobs\CancelOrderJob;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('product.index');
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

        
      

        //Product validation
        productValidationForm();
        //----------------------


        $product = new Product;
        $product->title_product = $request->get('title_product');
        $product->shipping_address = $request->get('shipping_address');
        $product->price = $request->get('price');
        $product->save();

        if($product->save()){

            $orderProduct = new Order;
            $orderProduct->user_id = \Auth::user()->id;
            $orderProduct->invoice_number = generateCode();
            $orderProduct->total_price = $request->get('price') + 10000;
            $orderProduct->save();


            //---------Queue------
            $job = (new CancelOrderJob())->delay(\Carbon\Carbon::now()->addMinutes(5));
            dispatch($job);
            //-------------------
            
            $orderProduct->products()->attach($product->id);
            
              
            return redirect()->route('success.index',['id' => $orderProduct->id]);

          
            
      

        }

       

      
       

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function processorder(){

        

    }

}
