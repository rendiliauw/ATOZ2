<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Order;
use App\Prepaid;
use App\Product;

class SuccessController extends Controller
{
    public function index(Request $request, $id){
    
    if($request->has('prepaid')){
        
        $result = Order::with('prepaids')->with('user')->findOrFail($id);

        return view('success.index',['result' => $result]);
    
    }elseif($request->has('idproduct')){


        $result = Order::with('products')->with('user')->findOrFail($id);

        return view('success.index',['result' => $result]);
    }    



    }

    public function storepayment(Request $request, $id){

        $storepayment = Order::findOrFail($id);

        return view('success.payment',['storepayment' => $storepayment]);
       
    }

    public function paymentproses(Request $request){


        $time1 = date('Y-m-d').' '.'09:00:00' ;
        $time2 = date('Y-m-d').' '.'15:00:00' ;
        
           $id = $request->get('id');
           $invoicepayment = $request->get('invoice_number');

           $user = \Auth::user()->id;

           $paymentproses = Order::with('prepaids')->with('products')->where('user_id',$user)->findOrFail($id);

            if(!$request->get('shipping_address')){

                if($paymentproses->created_at >= $time1 && $paymentproses->created_at <= $time2 ){
                      
                    $paymentproses->status = ordertimesuccess();


                }else{

                    $paymentproses->status = ordertimefailed();

                    

                }

                $paymentproses->update();

                if($paymentproses->status == 'SUCCESS'){

                    return redirect()->route('home')->with('status','Pembelian pulsa anda berhasil di proses');

                }else{

                    return redirect()->route('home')->with('status','Maaf, Pembelian pulsa anda gagal kami proses');

                }

            }    


            if($paymentproses->user_id == $user && $paymentproses->status !== 'CANCELED'   ){

                   if($paymentproses->invoice_number == $invoicepayment){ 

                            $paymentproses->status = 'SUCCESS';

                            if($request->has('shipping_address'))
                            {
                        
                            $paymentproses->shipping_code = shippingCode();

                                }

                                $paymentproses->update();

                                return redirect()->route('home')->with('status','Product is successfully paid');        
                             
                   }else{

                    return redirect()->route('home')->with('status','Failed paid, tidak boleh memasukan Invoice Number lain Atau Salah memasukan invoice number');

                   }

                   

                    
                }else{

                    return redirect()->route('home')->with('status','Failed paid, maaf pembayaran anda gagal karena melebihi waktu yang ditentukan');

                }


    }
}
