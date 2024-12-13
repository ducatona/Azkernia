<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Azkernia - Consulta SQL</title>
    <link rel="stylesheet" href="{{ asset('/css/principal.css') }}">
   

</head>

<body>


    <div class="container mt-5">
        <h1 class="text-center">¡Atrévete a defender el reino!</h1>
        <p class="text-center">Introduce tu consulta SQL para ver la solución de la base de datos:</p>

        <!-- Formulario para la consulta SQL -->
        <form action="" method="POST">
            @csrf

            <!-- Área de texto para ingresar la consulta SQL -->
            <div class="form-group">
                <label for="consulta">Consulta SQL</label>
                <textarea id="consulta" name="consulta" class="form-control" placeholder="Escribe tu consulta aquí..." required></textarea>
            </div>

            <!-- Botón para enviar la consulta -->
            <button type="submit" class="btn btn-warning btn-block">Ejecutar Consulta</button>

            <p>¿quieres salir? <a href="{{route('logout')}}">Salir</a></p>s
        </form>

        <!-- Área para mostrar la solución de la consulta -->
        @if(session('resultado'))
            <div class="mt-5">
                <h3>Resultado:</h3>
                <pre>{{ session('resultado') }}</pre>
            </div>
        @endif
    </div>
    
</body>

</html>
