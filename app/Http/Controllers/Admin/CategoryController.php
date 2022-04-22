<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\categories;
class CategoryController extends Controller
{
    public function index()
    {
        $data = categories::all();
        return view('admin.categories.index',compact('data'));
    }
    public function showAddCategory()
    {
        return view('admin.categories.addView');
    }
    public function handleAddCategory(Request $request)
    {
        $request->validate([
            'nameCategory'=>'required|min:8'
        ],
        [
            'nameCategory.required'=>'Tên chuyên mục không được để trống',
            'nameCategory.min'=>'Tên chuyên mục không được ít hơn :min kí tự',
        ]);

        $insert = categories::create([
            'name'=>$request->nameCategory,
        ]);
        if($insert)
        {
            return redirect()->route('admin.showCategories')->with('msg','Thêm chuyên mục thành công')->with('type','success');
        }else{
            return back()->with('msg','Thêm dữ liệu thất bại')->with('type','danger');
        }
    }
    public function showEditCategory($id)
    {
        $dataDetailCategory  = categories::find($id);
        return view('admin/categories/editCategory',compact('dataDetailCategory'));
    }
    public function handleUpdateCategory(Request $request,$id)
    {
        $dataUpdate = categories::find($id)->update([
            'name'=>$request->nameCategory,
        ]);
        if($dataUpdate)
        {
            return redirect()->route('admin.showCategories')->with('msg','Cập nhật chuyên mục thành công')->with('type','success');
        }else{
            return back()->with('msg','Thêm dữ liệu thất bại')->with('type','danger');
        }
    }
    public function handleDeleteCategory($id)
    {
        $deleteCategory = categories::destroy($id);
        if($deleteCategory)
        {
            return redirect()->route('admin.showCategories')->with('msg','Chuyên mục đã được chuyển vào thùng rác')->with('type','success');
        }else
        {
            return back()->with('msg','Xóa dữ liệu thất bại')->with('type','danger');
        }
    }
    public function showTrashCategory()
    {
        $dataTrashed = categories::onlyTrashed()->get();
        return view('admin/categories/showTrashCategory',compact('dataTrashed'));
    }
    public function handleCategoryRestore($id)
    {
        $data = categories::withTrashed()->find($id);
        $data->restore();
        return redirect()->route('admin.showCategories')->with('msg','Khôi phục chuyên mục thành công')->with('type','success');
    }
    public function handleCategoryForce($id)
    {
        $dataForce = categories::withTrashed()->find($id);
        $dataForce->forceDelete();
        return redirect()->route('admin.showCategories')->with('msg','Chuyên mục đã được xóa vĩnh viễn')->with('type','success');
    }
}
