@extends('admin.layout-admin')
@section('title','Chuyên mục đã xóa')
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col">
            </div>
        </div>
        <div class="row mt-5">
            <div class="col">
                <?php if(!empty($messageSuccess)):?>
                <h6 class="alert alert-success" role="alert"><?= $messageSuccess ?></h6>
                <?php endif; ?>
                <?php if(!empty($messageError)):?>
                <h6 class="alert alert-danger" role="alert"><?= $messageError?></h6>
                <?php endif; ?>
                @if(session('msg'))
                    <div class="alert alert-{{session('type')}}">
                        {{session('msg')}}
                    </div>
                @endif
                <table class="table ">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Tên chuyên mục</th>
                        <th>Ngày xóa</th>
                        <th colspan="2" width="5%" class="text-center">Action</th>
                    </tr>
                    </thead>
                    @foreach($dataTrashed as $key=>$value)
                        <tbody>
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>{{$value->name}}</td>
                            <td>{{$value->created_at}}</td>
                            <td>
                                <a class="btn btn-success" href="{{ route('admin.handleCategoryRestore',['id'=>$value->id]) }}">Khôi phục</a>
                            </td>
                            <td>
                                <a class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa?')" href="{{ route('admin.handleCategoryForce',['id'=>$value->id]) }}">Xóa vĩnh viễn</a>
                            </td>

                        </tr>
                        </tbody>
                    @endforeach

                </table>
                <div>

                </div>
            </div>
        </div>
    </div>
@endsection

