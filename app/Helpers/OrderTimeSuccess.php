<?php

if(!function_exists('ordertimesuccess')){


    function ordertimesuccess(){

        

    $random = rand(1,10);    
        
        if($random <= 9){

           return 'SUCCESS';

        }else{

           return 'FAILED'; 

        }


    }

}    