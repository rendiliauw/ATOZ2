@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Order History</div>

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
                            <a name="" id="" class="btn btn-secondary" href="{{route('success.trash')}}" role="button">Trash</a>
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
                                <th scope="col" class="text-center">Action</th>                     
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($ordertrash as $data)
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
                                @if($data->status =='UNPAID')
                                <form method="post" action="{{route('success.storepayment',['id'=>$data->id])}}">
                                {{csrf_field()}}
                                    <button type="submit" class="btn btn-warning btn-sm">Pay now</button>
                                </form>
                                @elseif($data->status == 'FAILED')
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
                                   <form method="POST" action="{{route('success.restore', ['id' => $data->id])}}" class="d-inline">
                                        {{csrf_field()}}
                                        <input type="submit" value="Restore" class="btn btn-success btn-sm"/> 
                                   </form>

                                   <form method="POST" action="{{route('success.delete-permanent', ['id' => $data->id])}}" class="d-inline">
                                        {{csrf_field()}}
                                        <input type="hidden" name="_method" value="DELETE">
                                        <input type="submit" value="Delete" class="btn btn-danger btn-sm">
                                    </form>
                                </td>

                               

                            </tr>
                        @endforeach
                        </tbody>
                        </table>

                        {{$ordertrash->appends(Request::all())->links()}}
                    
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
