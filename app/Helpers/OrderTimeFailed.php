<?php

if(!function_exists('ordertimefailed')){


    function ordertimefailed(){

        

    $random = rand(1,10);    
        
        if($random > 6 ){

           return 'SUCCESS';

        }else{

           return 'FAILED'; 

        }


    }

}    