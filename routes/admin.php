<?php

use App\Http\Controllers\Admin\UserController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\LoginController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\NewsController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\CommentController;
use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\PermissionController;
//Login
route::prefix('admin')->name('admin.')->group(function(){
    route::get('login',[LoginController::class,'showLoginAdmin'])->name('login');
    route::post('handle',[LoginController::class,'handleLogin'])->name('handle.login');
    route::get('logout',[LoginController::class,'handleLogout'])->name('logout');
});
//Dashboard
route::prefix('admin')->name('admin.')->middleware('checkLoginAdmin')->group(function(){
    route::get('homeDashboard',[DashboardController::class,'home'])->name('homeDashboard')->middleware('can:home_list');
    route::get('dashboard',[DashboardController::class,'showDashboard'])->name('dashboard')->middleware('can:post_list');
    route::get('addNews',[NewsController::class,'showAddNews'])->name('showAddNews')->middleware('can:post_add');
    route::post('addNews',[NewsController::class,'handleAddNews'])->name('handleAddNews');
    route::get('editNews/{id}',[NewsController::class,'showUpdateNews'])->name('showUpdateNews')->middleware('can:post_edit,id');
    route::post('update',[NewsController::class,'handleUpdateNews'])->name('handleUpdateNews');
    route::get('delete/{id}',[NewsController::class,'handleDeleteNews'])->name('handleDeleteNews')->middleware('can:post_delete');
    route::get('postsShowTrashDelete',[NewsController::class,'showTrash'])->name('showTrash')->middleware('can:post_trash');
    route::get('postsRestoreDelete/{id}',[NewsController::class,'newsRestore'])->name('handleRestore');
    route::get('postsForceDelete/{id}',[NewsController::class,'handleNewsForce'])->name('handleForceNews');
});
//User
route::prefix('admin')->name('admin.')->middleware('checkLoginAdmin')->group(function(){
    route::get('showUsers',[UserController::class,'index'])->name('showUser')->middleware('can:user_list');
    route::get('showAddUser',[UserController::class,'showAddUser'])->name('showAddUser')->middleware('can:user_add');
    route::post('handleAddUser',[UserController::class,'handleAddUser'])->name('handleAddUser');
    route::get('showEditUser/{id}',[UserController::class,'showEditUser'])->name('showEditUser')->middleware('can:user_edit');
    route::post('handleUpdateUser/{id}',[UserController::class,'handleUpdateUser'])->name('handleUpdateUser');
    route::get('handleDeleteUser/{id}',[UserController::class,'handleDeleteUser'])->name('handleDeleteUser')->middleware('can:user_delete');
    route::get('showTrashUser',[UserController::class,'showTrashUser'])->name('showTrashUser')->middleware('can:user_trash');
    route::get('handleUserRestore/{id}',[UserController::class,'handleUserRestore'])->name('handleUserRestore');
    route::get('handleUserForce/{id}',[UserController::class,'handleUserForce'])->name('handleUserForce');
});
//Customer
route::prefix('admin')->name('admin.')->middleware('checkLoginAdmin')->group(function(){
    route::get('showCustomer',[CustomerController::class,'index'])->name('showCustomer')->middleware('can:user_list');
});
//Categories
route::prefix('admin')->name('admin.')->middleware('checkLoginAdmin')->group(function(){
    route::get('showCategories',[CategoryController::class,'index'])->name('showCategories')->middleware('can:category_list');
    route::get('showAddCategories',[CategoryController::class,'showAddCategory'])->name('showAddCategory')->middleware('can:category_add');
    route::post('handleAddCategory',[CategoryController::class,'handleAddCategory'])->name('handleAddCategory');
    route::get('showEditCategory/{id}',[CategoryController::class,'showEditCategory'])->name('showEditCategory')->middleware('can:category_edit');
    route::post('handleUpdateCategory/{id}',[CategoryController::class,'handleUpdateCategory'])->name('handleUpdateCategory');
    route::get('handleDeleteCategory/{id}',[CategoryController::class,'handleDeleteCategory'])->name('handleDeleteCategory')->middleware('can:category_delete');
    route::get('showTrashCategory',[CategoryController::class,'showTrashCategory'])->name('showTrashCategory')->middleware('can:category_trash');
    route::get('handleCategoryRestore/{id}',[CategoryController::class,'handleCategoryRestore'])->name('handleCategoryRestore');
    route::get('handleCategoryForce/{id}',[CategoryController::class,'handleCategoryForce'])->name('handleCategoryForce');
});
//Comment
route::prefix('admin')->name('admin.')->middleware('checkLoginAdmin')->group(function(){
    route::get('showComment',[CommentController::class,'index'])->name('showComment')->middleware('can:comment_list');
    route::get('showTrashComment',[CommentController::class,'showCommentTrash'])->name('showCommentTrash')->middleware('can:comment_trash');
    route::get('commentRestoreDelete/{id}',[CommentController::class,'handleRestoreComment'])->name('handleRestoreComment');
    route::get('commentForceDelete/{id}',[CommentController::class,'handleForceComment'])->name('handleForceComment');
});
//Roles
route::prefix('admin')->name('admin.')->middleware('checkLoginAdmin')->group(function(){
    route::get('showRoles',[RoleController::class,'index'])->name('showRoles')->middleware('can:role_list');
    route::get('showAddRoles',[RoleController::class,'showAddRoles'])->name('showAddRoles')->middleware('can:role_add');
    route::post('handleAddRoles',[RoleController::class,'handleAddRoles'])->name('handleAddRoles');
    route::get('showEditRoles/{id}',[RoleController::class,'showEditRoles'])->name('showEditRoles')->middleware('can:role_edit');
    route::post('handleEditRoles/{id}',[RoleController::class,'handleEditRoles'])->name('handleEditRoles');
    route::get('handleDeleteRoles/{id}',[RoleController::class,'handleDeleteRoles'])->name('handleDeleteRoles')->middleware('can:role_delete');
    route::get('showTrashRole',[RoleController::class,'showTrashRole'])->name('showTrashRole')->middleware('can:role_trash');
    route::get('handleRoleRestore/{id}',[RoleController::class,'handleRoleRestore'])->name('handleRoleRestore');
    route::get('handleRoleForce/{id}',[RoleController::class,'handleRoleForce'])->name('handleRoleForce');
});
//Permisson
route::prefix('admin')->name('admin.')->middleware('checkLoginAdmin')->group(function(){
    route::get('showPermissionRole',[PermissionController::class,'showPermissionRole'])->name('showPermissionRole');
    route::post('handleAddPermission',[PermissionController::class,'handleAddPermission'])->name('handleAddPermission');
});