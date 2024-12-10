<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Mission
 * 
 * @property int $id
 * @property string $name
 * @property string|null $description
 * @property string|null $reward_resources
 * @property string|null $reward_troops
 * @property string|null $difficulty
 *
 * @package App\Models
 */
class Mission extends Model
{
	protected $table = 'missions';
	public $timestamps = false;

	protected $fillable = [
		'name',
		'description',
		'reward_resources',
		'reward_troops',
		'difficulty'
	];
}
