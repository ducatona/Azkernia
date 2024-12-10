<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Principal</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

    <div class="navbar-right">
        <a href="{{ url('/login') }}" class="btn btn-primary mb-3">Login</a>
        <a href="{{ url('/register') }}" class="btn btn-secondary mb-3">Register</a>
    </div>
    <h1 class="text-center mt-3">Azkernia</h1>
    <div class="container text-center mt-5">
        <a href="#" class="btn btn-warning mb-3">Jugar</a>
    </div>



</body>

</html>