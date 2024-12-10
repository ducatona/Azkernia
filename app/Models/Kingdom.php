<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Kingdom
 * 
 * @property int $id
 * @property int $user_id
 * @property string $name
 * 
 * @property User $user
 * @property Collection|Defense[] $defenses
 * @property Collection|Resource[] $resources
 * @property Collection|Troop[] $troops
 *
 * @package App\Models
 */
class Kingdom extends Model
{
	protected $table = 'kingdoms';
	public $timestamps = false;

	protected $casts = [
		'user_id' => 'int'
	];

	protected $fillable = [
		'user_id',
		'name'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function defenses()
	{
		return $this->hasMany(Defense::class);
	}

	public function resources()
	{
		return $this->hasMany(Resource::class);
	}

	public function troops()
	{
		return $this->hasMany(Troop::class);
	}
}
