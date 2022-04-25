<?php

namespace App\Policies;

use App\Models\User;
use App\Models\categories;
use Illuminate\Auth\Access\HandlesAuthorization;
class CategoryPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function viewAny(User $user)
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\categories  $categories
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user)
    {
            return $user->checkPermissionAccess('list_categories');
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(User $user)
    {
        return $user->checkPermissionAccess('add_categories');
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\categories  $categories
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user)
    {
        return $user->checkPermissionAccess('update_categories');
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\categories  $categories
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user)
    {
        return $user->checkPermissionAccess('delete_categories');
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\categories  $categories
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function trash(User $user)
    {
        return $user->checkPermissionAccess('trash_categories');
    }
    public function restore(User $user, categories $categories)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Models\categories  $categories
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, categories $categories)
    {
        //
    }
}
