<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        main { padding: 50px; }
        body { background-color: #f8f9fa; font-family: 'Arial', sans-serif; }
        .container { max-width: 500px; margin-top: 100px; }
        .card { padding: 20px; border-radius: 10px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); }
        h2 { color: #333; font-weight: bold; }
        .btn-primary { background-color: #007bff; border: none; }
        .btn-primary:hover { background-color: #0056b3; }
        .alert { margin-top: 10px; }
    </style>
</head>
<body>

<main>
    @if(Auth::check())
        <p>Bienvenido, {{ Auth::user()->username }}. Ya estás logueado.</p>
        <a href="{{ route('principal') }}" class="btn btn-primary">Ir a la página principal</a>
    @else
        <h1>Inicio de Sesión</h1>
        <form method="POST" action="{{ route('login') }}">
            @csrf
            <div class="form-group">
                <label for="username">Usuario</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <p>¿No estás registrado aún? <a href="{{ route('register') }}">Regístrate aquí</a></p>
            <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
        </form>
    @endif
</main>

</body>
</html>
