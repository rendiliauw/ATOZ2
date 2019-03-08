<?php

if(!function_exists('shippingCode')){


    function shippingCode(){

        //$auth = \Auth::user()->id;
            $data = 'ABCDEFGHIJKLMNOPQRSTU1234567890';
            $string = '';
                for($i = 0; $i < 10; $i++) {
                    $pos = rand(0, strlen($data)-1);
                    $string .= $data{$pos};
                    }

            $code = $string;

            return $code;


    }

}    