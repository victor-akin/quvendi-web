<?php

namespace App\Providers;

use App\Helpers\ModelUID;
use Illuminate\Support\Facades\App;
use Illuminate\Support\ServiceProvider;

class ModelUIDServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('ModelUID',function(){

            return new ModelUID();
    
        });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
