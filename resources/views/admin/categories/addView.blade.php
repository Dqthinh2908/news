@extends('admin.layout-admin')
@section('title','Thêm chuyên mục')

@section('content')
    <div class="container-fluid">
        <form action="{{route('admin.handleAddCategory')}}"  method="POST" accept-charset="utf-8">
            @csrf
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                    <h1>Thêm chuyên mục mới</h1>
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach 
                            </ul>
                        </div>
                    @endif
                    <div class="mb-3">
                        <label for="titleNews" class="form-label">Tên chuyên mục(*)</label>
                        <input type="text" name="nameCategory" class="form-control" id="titleNews">
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Thêm mới</button>

        </form>
        <!-- /.content -->
    </div><!-- /.content-wrapper -->
@endsection

