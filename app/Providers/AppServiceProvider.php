<?php

namespace App\Providers;

use TCG\Voyager\Http\Controllers\VoyagerController;
use App\Http\Controllers\VoyagerDashboardController;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(VoyagerController::class, VoyagerDashboardController::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
