<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Troop
 * 
 * @property int $id
 * @property int $kingdom_id
 * @property string $type
 * @property int|null $quantity
 * 
 * @property Kingdom $kingdom
 * @property Collection|Defense[] $defenses
 *
 * @package App\Models
 */
class Troop extends Model
{
	protected $table = 'troops';
	public $timestamps = false;

	protected $casts = [
		'kingdom_id' => 'int',
		'quantity' => 'int'
	];

	protected $fillable = [
		'kingdom_id',
		'type',
		'quantity'
	];

	public function kingdom()
	{
		return $this->belongsTo(Kingdom::class);
	}

	public function defenses()
	{
		return $this->hasMany(Defense::class);
	}
}
