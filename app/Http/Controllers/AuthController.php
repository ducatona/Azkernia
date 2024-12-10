<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AuthController 
{
    // Registro de un nuevo usuario
    public function register(Request $request)
    {
        $validated = $request->validate([
            'username' => 'required|string|max:255|unique:users',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:8|confirmed',
            'password_confirmation' => 'required',
        ], [
            'username.required' => 'El nombre de usuario es obligatorio.',
            'username.unique' => 'El nombre de usuario ya está en uso.',
            'email.required' => 'El correo electrónico es obligatorio.',
            'email.email' => 'El correo electrónico debe ser válido.',
            'email.unique' => 'El correo electrónico ya está registrado.',
            'password.required' => 'La contraseña es obligatoria.',
            'password.min' => 'La contraseña debe tener al menos 8 caracteres.',
            'password.confirmed' => 'Las contraseñas no coinciden.',
        ]);

        // Crear un nuevo usuario en la base de datos
        $user = new User();
        $user->username = $request->username;
        $user->first_name = $request->first_name; // Para el primer nombre
        $user->last_name = $request->last_name; // Para los apellidos
        $user->email = $request->email;
        $user->password = Hash::make($request->password); // Encriptar la contraseña

        $user->save();

        return redirect()->route('login');
    }

    // Login del usuario
    public function login(Request $request)
    {
        // Validar los datos de entrada
        $validated = $request->validate([
            'username' => 'required|string', 
            'password' => 'required|string',
        ]);

        // Intentar autenticar al usuario
        $credentials = $request->only('username', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            // session(['user_id' => $user->id]);  // Guardamos el ID del usuario en la sesión

            return redirect()->route('principal');
        } else {
            return back()->with('error', 'Credenciales incorrectas');
        }
    }

    // Logout del usuario
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('welcome');
    }
}
?>