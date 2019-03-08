@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">Success !</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                        <div class="row mb-2">
                            <div class="col">
                                Order id 
                            </div>
                            
                            <div class="col">
                                <p>{{$result->invoice_number}}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                Total
                            </div>
                            
                            <div class="col">
                                <p>{{$result->total_price}}</p>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col">
                  
                            @foreach($result->prepaids as $data)
                                <p style="font-size:12px;">Your mobile phone number <i><b>{{$data->mobile_number}}</b></i> will receive <i><b>{{$data->price}}</b></i></p>
                            @endforeach  
                    
                             @foreach($result->products as $data1)
                                <p style="font-size:12px;"><i><b>{{$data1->title_product}}</b></i> that costs <i><b>{{$result->total_price}}</b></i> Will be shipped to: <i><b>{{$data1->shipping_address}}</b></i></p>
                                <p style="font-size:12px; font-weight:bold;">Only after you pay</p>
                             @endforeach  
                    
                            </div>
                        </div>

                        <form class="mt-4" method="post" action="{{route('success.storepayment',['id'=> $result->id])}}">
                        {{csrf_field()}}
                            <div class="text-center">
                                <input type="hidden" name="id" value="{{$result->id}}">
                        @foreach($result->prepaids as $data)
                                <input type="hidden" name="mobile_number" value="{{$data->mobile_number}}">
                        @endforeach   

                         @foreach($result->products as $data1)
                                <input type="hidden" name="shipping_address" value="{{$data1->shipping_address}}">
                         @endforeach    
                                <button type="submit" class="btn btn-primary btn-sm">Pay now</button>
                            </div>
                        </form>

                        
                        
                        
                      
                </div>
            </div>
        </div>
    </div>
</div>
@endsection