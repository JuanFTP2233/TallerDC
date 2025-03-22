CREATE DATABASE IF NOT EXISTS Base_Pokemon;
USE Base_Pokemon;

CREATE TABLE pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    nivel INT NOT NULL
);

CREATE TABLE entrenadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

CREATE TABLE batallas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entrenador1_id INT,
    entrenador2_id INT,
    ganador_id INT,
    fecha DATE,
    FOREIGN KEY (entrenador1_id) REFERENCES entrenadores(id),
    FOREIGN KEY (entrenador2_id) REFERENCES entrenadores(id),
    FOREIGN KEY (ganador_id) REFERENCES entrenadores(id)
);

CREATE TABLE equipo_pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entrenador_id INT,
    pokemon_id INT,
    FOREIGN KEY (entrenador_id) REFERENCES entrenadores(id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
);

-- Insertar Pokémon
INSERT INTO pokemon (nombre, tipo, nivel) VALUES ('Pikachu', 'Eléctrico', 25);
INSERT INTO pokemon (nombre, tipo, nivel) VALUES ('Charmander', 'Fuego', 20);
INSERT INTO pokemon (nombre, tipo, nivel) VALUES ('Squirtle', 'Agua', 22);
INSERT INTO pokemon (nombre, tipo, nivel) VALUES ('Bulbasaur', 'Planta', 23);

-- Insertar Entrenadores
INSERT INTO entrenadores (nombre, ciudad) VALUES ('Ash Ketchum', 'Pueblo Paleta');
INSERT INTO entrenadores (nombre, ciudad) VALUES ('Misty', 'Ciudad Celeste');
INSERT INTO entrenadores (nombre, ciudad) VALUES ('Brock', 'Ciudad Plateada');

-- Asignar Pokémon a Entrenadores
INSERT INTO equipo_pokemon (entrenador_id, pokemon_id) VALUES (1, 1);
INSERT INTO equipo_pokemon (entrenador_id, pokemon_id) VALUES (2, 3);
INSERT INTO equipo_pokemon (entrenador_id, pokemon_id) VALUES (3, 4);

-- Insertar una batalla
INSERT INTO batallas (entrenador1_id, entrenador2_id, ganador_id, fecha) VALUES (1, 2, 1, '2024-03-20');
