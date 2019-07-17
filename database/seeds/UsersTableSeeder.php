<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        factory(App\User::class)->create(
            [
                'firstname' => "username",
                'lastname' => "lastname",
                'email' => "useremail@gmail.com",
                'phone_no' => '0809875432',
                'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'  // password
            ]
        );

        factory(App\User::class, 10)->create();
    }
}
