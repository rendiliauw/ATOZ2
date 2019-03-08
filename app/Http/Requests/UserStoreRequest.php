<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email' => 'Required|email',
            'password' => 'Required|min:5',
            'name' => 'Required|string|min:3',
            'mobile_number' => 'Required|digits_between:7,12|numeric',
            'value' => 'Required',
            'title_product' => 'required|min:10|max:150',
            'shipping_address' => 'required|min:10|max:150',
            'price'=> 'Required|digits_between:0,10'
        ];
    }
}
