<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página principal</title>
</head>
<body>

<h1>Bienvenido @auth {{Auth::user()->username}} @endauth</h1>
    


<p>¿quieres salir? <a href="{{route('logout')}}">Salir</a></p>
</body>
</html>