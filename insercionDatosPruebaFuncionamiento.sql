-- Insertar usuarios
 

create database azkernia;
-- VE A EL PROYECTO Y CON LA BD VACIA MIGRA LOS DATOS , INTRODUCE EL SEEDERD DE ALLI , INSERTE DOS USUARIOS DE PRUEBA, E INSERTA ESTE SCRIPT, SI NO PUEDES UTILIZAR LOS DATOS QUE QUIERA
-- Insertar reinos (relacionados con usuarios)
INSERT INTO kingdoms (user_id, name) VALUES
(1, 'Kingdom Alpha'),
(2, 'Kingdom Beta');
 
 
-- Insertar recursos (relacionados con reinos)azkernia
INSERT INTO resources (kingdom_id, gears, empty_valves, steam) VALUES
(1, 1000, 800, 1200),
(2, 900, 700, 1100);
 
-- Insertar tropas (relacionadas con reinos)
INSERT INTO troops (kingdom_id, type, quantity) VALUES
(1, 'Soldier', 100),
(1, 'Scout', 50),
(2, 'Archer', 80),
(2, 'Knight', 30);
 
-- Insertar defensa (relacionada con reinos y tropas)
INSERT INTO defenses (kingdom_id, troop_id, quantity_used, result) VALUES
(1, 1, 20, TRUE),
(1, 2, 10, FALSE),
(2, 3, 15, TRUE),
(2, 4, 5, FALSE);