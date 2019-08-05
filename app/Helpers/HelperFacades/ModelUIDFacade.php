<?php

namespace App\Helpers\HelperFacades;

use Illuminate\Support\Facades\Facade;

class ModelUIDFacade extends Facade
{
    protected static function getFacadeAccessor()
    {
        return 'ModelUID';
    }
}

