<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Defense
 * 
 * @property int $id
 * @property int $kingdom_id
 * @property int $troop_id
 * @property int|null $quantity_used
 * @property bool|null $result
 * @property Carbon|null $created_at
 * 
 * @property Kingdom $kingdom
 * @property Troop $troop
 *
 * @package App\Models
 */
class Defense extends Model
{
	protected $table = 'defenses';
	public $timestamps = false;

	protected $casts = [
		'kingdom_id' => 'int',
		'troop_id' => 'int',
		'quantity_used' => 'int',
		'result' => 'bool'
	];

	protected $fillable = [
		'kingdom_id',
		'troop_id',
		'quantity_used',
		'result'
	];

	public function kingdom()
	{
		return $this->belongsTo(Kingdom::class);
	}

	public function troop()
	{
		return $this->belongsTo(Troop::class);
	}
}
