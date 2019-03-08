<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Product extends Model
{

    // public function orders(){
    //     return $this->belongsToMany('App\Order');
    // }

    public function orders(){
        return $this->morphToMany()('App\Order','orderable');
    }

    public function getPriceAttribute($value){

        $result = 'Rp '.number_format($value,0,',','.');
	    return $result;


    }

    public function setTitleProductAttribute($value){
        $this->attributes['title_product'] = ucfirst($value);
    }

    public function setShippingAddressAttribute($value){
        $this->attributes['shipping_address'] = ucfirst($value);
    }


}
