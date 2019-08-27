<?php

namespace App\Http\Widgets;

use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;
use App\Merchant;


class MerchantsDimmer extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = Merchant::count();
        $string = 'Merchants';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-polaroid',
            'title'  => "{$count} {$string}",
            'text'   => "There are $count merchants. Click button below to view all merchants.",
            'button' => [
                'text' => 'View all merchants',
                'link' => route('voyager.merchants.index'),
            ],
            'image' => voyager_asset('images/widget-backgrounds/03.jpg'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return true;
    }
    
}




