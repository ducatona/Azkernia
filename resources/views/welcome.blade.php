<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Principal</title>
    <link rel="stylesheet" href="{{ asset('css/welcome.css') }}">
</head>

<body>

    <!-- Barra de navegación -->
    <div class="navbar-right">
        <a href="{{ url('/login') }}" class="btn btn-login mb-3">Iniciar Sesión</a>
        <a href="{{ url('/register') }}" class="btn btn-register mb-3">Registrarse</a>
    </div>

    <!-- Encabezado principal -->
    <h1 class="text-center mt-3">Azkernia</h1>

    <!-- Texto introductorio -->
    <div class="container text-center mt-4">
        <p class="intro-text">
            ¡Bienvenido a Azkernia! Una tierra de reinos en conflicto, misterios ancestrales y grandes aventuras. 
            Aquí, tú decides el destino del reino. ¿Serás un estratega brillante o un conquistador temido?
        </p>
        <p class="intro-text">
            Tu viaje comienza aquí. ¡Prepárate para defender tus tierras, resolver enigmas y forjar tu legado!
        </p>
    <br><br>
        <!-- Botón para comenzar a jugar -->
        <a href="#" class="btn btn-play mb-3">Jugar Ahora</a>
    </div>

</body>

</html>
