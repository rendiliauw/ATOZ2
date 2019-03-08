@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header">Trash History</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <div class="row">
                        <div class="col-sm-6">
                            <form action="{{route('home')}}" class="form-inline mb-2">
                                <input class="form-control mr-sm-2" type="search" name="keyword" value="{{Request::get('keyword')}}" placeholder="Search" aria-label="Search">
                                <input type="submit" value="search" class="btn btn-primary" >
                            </form>    
                        </div>
                        <div class="col-sm-2">
                            
                        </div>
                        {{--  <div class="col-sm-2">
                            <a name="" id="" class="btn btn-secondary" href="#" role="button">Trash</a>
                        </div>  --}}
                    </div>

                    
                        <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">Order Date</th>
                                <th scope="col">Order Number</th>
                                <th scope="col">Description</th>
                                <th scope="col">Total Price</th>
                                <th scope="col">Status</th>     
                                <th scope="col">Action</th>                     
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($show as $data)
                            <tr>
                                <td>{{$data->created_at}}</td>
                                <td>{{$data->invoice_number}}</td>  
                                <td>
                             
                                    @foreach($data->prepaids as $prepaid)
                                            {{$prepaid->price.' For '.$prepaid->mobile_number}} 
                                    @endforeach 
                        
                                    @foreach($data->products as $product)
                                        {{$product->title_product.' That costs '.$data->total_price}}
                                    @endforeach 

                                </td>
                                <td>{{$data->total_price}}</td>
                                <td>
                                @if($data->status == 'FAILED')
                                    <span class="badge badge-danger">FAILED</span>
                                @elseif($data->status=='CANCELED')
                                    <span class="badge badge-secondary">CANCELED</span>
                                @else
                                    @if($data->shipping_code)
                                        <span class="badge badge-warning">{{$data->shipping_code}}</span>
                                    @else
                                        <span class="badge badge-success">SUCCESS</span>
                                    @endif
                                @endif    
                                </td>
                                
                                <td>
                                   <a name="" id="" class="btn btn-primary" href="#" role="button">Restore</a>
                                   <a name="" id="" class="btn btn-primary" href="#" role="button">Delete</a>
                                </td>


                               

                            </tr>

                           
                               
                                    
                       
                        

                        @endforeach    
                        </tbody>
                        </table>

                        {{$show->appends(Request::all())->links()}}
                    
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
