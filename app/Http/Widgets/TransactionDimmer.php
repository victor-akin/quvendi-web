<?php

namespace App\Http\Widgets;

use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use Arrilot\Widgets\AbstractWidget;
use App\Transaction;


class TransactionDimmer extends AbstractWidget
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
        $count = Transaction::count();
        $string = 'Transactions';
        // $string = trans_choice('voyager::dimmer.post', $count);

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-receipt',
            'title'  => "{$count} {$string}",
            'text'   => "There are $count completed transactions. Click button below to view all transactions.",
            'button' => [
                'text' => 'View all transactions',
                'link' => route('voyager.transactions.index'),
            ],
            'image' => voyager_asset('images/widget-backgrounds/02.jpg'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return app('VoyagerAuth')->user()->can('browse', Voyager::model('Post'));
    }
    
}




