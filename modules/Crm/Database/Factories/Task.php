<?php

namespace Modules\Crm\Database\Factories;

use Date;
use App\Abstracts\Factory;
use Modules\Crm\Models\Contact;
use Modules\Crm\Jobs\CreateContact;
use Modules\Crm\Models\Task as Model;

class Task extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Model::class;

    public function definition()
    {
        $contact = $this->dispatch(new CreateContact(Contact::factory()->enabled()->raw()));

        return [
            'company_id' => $this->company->id,
            'created_by' => 1,
            'id' => $contact->id,
            'type' => 'contacts',
            'name' => $this->faker->name,
            'description' => $this->faker->text(),
            'user_id' => $this->user->id,
            'started_time_at' => $this->faker->time('H:i', 'now'),
            'started_at' => Date::now()->toDateString(),
        ];
    }
}

