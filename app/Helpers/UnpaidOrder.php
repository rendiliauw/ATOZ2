<?php 

    if(!function_exists('unpaidorder')){

        function unpaidOrder(){

            $unpaid= App\Order::with('user')->with('prepaids')->with('products')->where('user_id',\Auth::user()->id)->where('status','UNPAID')->orderBy('created_at','DESC')->count();
                    

            return $unpaid;
                    //-------------------------------------------------------------------------------------------------


        }

        
    }

