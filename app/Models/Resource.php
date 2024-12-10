<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Resource
 * 
 * @property int $id
 * @property int $kingdom_id
 * @property int|null $gears
 * @property int|null $empty_valves
 * @property int|null $steam
 * 
 * @property Kingdom $kingdom
 *
 * @package App\Models
 */
class Resource extends Model
{
	protected $table = 'resources';
	public $timestamps = false;

	protected $casts = [
		'kingdom_id' => 'int',
		'gears' => 'int',
		'empty_valves' => 'int',
		'steam' => 'int'
	];

	protected $fillable = [
		'kingdom_id',
		'gears',
		'empty_valves',
		'steam'
	];

	public function kingdom()
	{
		return $this->belongsTo(Kingdom::class);
	}
}
