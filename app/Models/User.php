<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class User
 * 
 * @property int $id
 * @property string $username
 * @property string $password
 * @property string|null $first_name
 * @property string|null $last_name
 * @property string|null $email
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property Collection|Kingdom[] $kingdoms
 *
 * @package App\Models
 */
class User extends Authenticatable
{
	protected $table = 'users';

	protected $hidden = [
		'password'
	];

	protected $fillable = [
		'username',
		'password',
		'first_name',
		'last_name',
		'email'
	];

	public function kingdoms()
	{
		return $this->hasMany(Kingdom::class);
	}
}
