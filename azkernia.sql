-- Crear la base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS azkernia;

-- Seleccionar la base de datos
USE azkernia;

-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARYusers KEY, -- Laravel usa 'id' como nombre por defecto para la columna de clave primaria
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL, -- En Laravel 'password' es el nombre por defecto para la columna de contraseña
    first_name VARCHAR(50), -- Cambié 'nombre' por 'first_name' para seguir la convención de nombres
    last_name VARCHAR(50),  -- Cambié 'apellidos' por 'last_name' para seguir la convención de nombres
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Laravel usa 'created_at' para la fecha de creación
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Laravel usa 'updated_at' para la fecha de actualización
);

-- Crear la tabla de reinos
CREATE TABLE IF NOT EXISTS kingdoms (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Cambié 'id_reino' por 'id' y 'reinos' por 'kingdoms'
    user_id INT NOT NULL, -- Cambié 'id_usuario' por 'user_id' para seguir la convención de Laravel
    name VARCHAR(100) NOT NULL, -- Cambié 'nombre_reino' por 'name'
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Crear la tabla de misiones
CREATE TABLE IF NOT EXISTS missions (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Cambié 'id_mision' por 'id' y 'misiones' por 'missions'
    name VARCHAR(100) NOT NULL, -- Cambié 'nombre_mision' por 'name'
    description TEXT, -- Cambié 'descripcion' por 'description'
    reward_resources VARCHAR(255), -- Cambié 'recompensa_recursos' por 'reward_resources'
    reward_troops VARCHAR(255), -- Cambié 'recompensa_tropas' por 'reward_troops'
    difficulty VARCHAR(50) DEFAULT 'Medium' -- Cambié 'dificultad' por 'difficulty'
);

-- Crear la tabla de recursos
CREATE TABLE IF NOT EXISTS resources (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Cambié 'id_recurso' por 'id' y 'recursos' por 'resources'
    kingdom_id INT NOT NULL, -- Cambié 'id_reino' por 'kingdom_id' para seguir la convención
    gears INT DEFAULT 500, -- Cambié 'engranajes' por 'gears'
    empty_valves INT DEFAULT 500, -- Cambié 'valvulas_vacio' por 'empty_valves'
    steam INT DEFAULT 500, -- Cambié 'vapor' por 'steam'
    FOREIGN KEY (kingdom_id) REFERENCES kingdoms(id)
);

-- Crear la tabla de tropas
CREATE TABLE IF NOT EXISTS troops (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Cambié 'id_tropa' por 'id' y 'tropas' por 'troops'
    kingdom_id INT NOT NULL, -- Cambié 'id_reino' por 'kingdom_id' para seguir la convención
    type VARCHAR(50) NOT NULL, -- Cambié 'tipo' por 'type'
    quantity INT DEFAULT 0, -- Cambié 'cantidad' por 'quantity'
    FOREIGN KEY (kingdom_id) REFERENCES kingdoms(id)
);

-- Crear la tabla de defensa
CREATE TABLE IF NOT EXISTS defenses (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Cambié 'id_defensa' por 'id' y 'defensa' por 'defenses'
    kingdom_id INT NOT NULL, -- Cambié 'id_reino' por 'kingdom_id' para seguir la convención
    troop_id INT NOT NULL, -- Cambié 'id_tropa' por 'troop_id' para seguir la convención
    quantity_used INT DEFAULT 0, -- Cambié 'cantidad_usada' por 'quantity_used'
    result BOOLEAN DEFAULT FALSE, -- Cambié 'resultado' por 'result'
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Cambié 'fecha' por 'created_at' para seguir la convención
    FOREIGN KEY (kingdom_id) REFERENCES kingdoms(id),
    FOREIGN KEY (troop_id) REFERENCES troops(id)
);
