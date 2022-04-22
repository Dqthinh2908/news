<?php

namespace App\Services;
use Illuminate\Support\Facades\Gate;


class PermissionGateAndPolicyAccess{
    public function setGateAndPolicyAccess()
    {
        $this->defineGatePost();
        $this->defineGateCategory();
        $this->defineGateUser();
        $this->defineGateRole();
        
    }
    public function defineGatePost()
    {
        Gate::define('post_list','App\Policies\PostPolicy@view');
        Gate::define('post_add', 'App\Policies\PostPolicy@create');
        Gate::define('post_edit', 'App\Policies\PostPolicy@update');
        Gate::define('post_delete','App\Policies\PostPolicy@delete');
        Gate::define('post_trash','App\Policies\PostPolicy@trash');
    }
    public function defineGateCategory()
    {
        Gate::define('category_list','App\Policies\CategoryPolicy@view');
        Gate::define('category_add', 'App\Policies\CategoryPolicy@create');
        Gate::define('category_edit', 'App\Policies\CategoryPolicy@update');
        Gate::define('category_delete','App\Policies\CategoryPolicy@delete');
        Gate::define('category_trash','App\Policies\CategoryPolicy@trash');
    }
    public function defineGateUser()
    {
        Gate::define('user_list','App\Policies\UserPolicy@view');
        Gate::define('user_add', 'App\Policies\UserPolicy@create');
        Gate::define('user_edit', 'App\Policies\UserPolicy@update');
        Gate::define('user_delete','App\Policies\UserPolicy@delete');
        Gate::define('user_trash','App\Policies\UserPolicy@trash');
    }
    public function defineGateRole()
    {
        Gate::define('role_list','App\Policies\RolePolicy@view');
        Gate::define('role_add', 'App\Policies\RolePolicy@create');
        Gate::define('role_edit', 'App\Policies\RolePolicy@update');
        Gate::define('role_delete','App\Policies\RolePolicy@delete');
        Gate::define('role_trash','App\Policies\RolePolicy@trash');
    }
}