<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Registro</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 30px;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-container .btn-submit {
            width: 100%;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            padding: 10px;
            border-radius: 5px;
        }
        .form-container .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <div class="form-container">
        <h2>Formulario de Registro</h2>
        <form method="POST" action="{{ route('register') }}">
            @csrf

            <div class="form-group">
                <label for="username">Nombre de usuario</label>
                <input type="text" class="form-control" id="username" name="username" required aria-label="Nombre de usuario">
            </div>

            <div class="form-group">
                <label for="first_name">Nombre</label>
                <input type="text" class="form-control" id="first_name" name="first_name" required aria-label="Nombre">
            </div>

            <div class="form-group">
                <label for="last_name">Apellidos</label>
                <input type="text" class="form-control" id="last_name" name="last_name" required aria-label="Apellidos">
            </div>

            <div class="form-group">
                <label for="email">Correo electrónico</label>
                <input type="email" class="form-control" id="email" name="email" required aria-label="Correo electrónico">
            </div>

            <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password" required aria-label="Contraseña">
            </div>

            <div class="form-group">
                <label for="password_confirmation">Confirmar contraseña</label>
                <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" required aria-label="Confirmar contraseña">
            </div>

            <button type="submit" class="btn btn-submit">Registrar</button>
        </form>
    </div>

</body>

</html>
