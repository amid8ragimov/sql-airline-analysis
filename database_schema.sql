-- =========================
-- DATABASE SCHEMA + DATA
-- =========================

-- Таблица пассажиров
CREATE TABLE Passenger (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Таблица рейсов
CREATE TABLE Trip (
    id INT PRIMARY KEY,
    town_from VARCHAR(50),
    town_to VARCHAR(50)
);

-- Таблица полётов пассажиров
CREATE TABLE Pass_in_trip (
    passenger INT,
    trip INT,
    date DATE
);

-- =========================
-- Пассажиры (футболисты)
-- =========================
INSERT INTO Passenger (id, name) VALUES
(1, 'Jude Bellingham'),
(2, 'Vinicius Junior'),
(3, 'Rodrygo'),
(4, 'Luka Modric'),
(5, 'Toni Kroos'),
(6, 'Federico Valverde'),
(7, 'Eduardo Camavinga'),
(8, 'Aurelien Tchouameni'),
(9, 'Dani Carvajal'),
(10, 'Thibaut Courtois'),
(11, 'Kylian Mbappe');

-- =========================
-- Рейсы
-- =========================
INSERT INTO Trip (id, town_from, town_to) VALUES
(1, 'Madrid', 'London'),
(2, 'Madrid', 'Paris'),
(3, 'Madrid', 'Berlin'),
(4, 'Madrid', 'Rome'),
(5, 'Madrid', 'New York');

-- =========================
-- Полёты пассажиров
-- =========================
INSERT INTO Pass_in_trip (passenger, trip, date) VALUES
(1, 1, '2024-01-10'),
(2, 1, '2024-01-10'),
(3, 2, '2024-02-05'),
(4, 3, '2024-02-12'),
(5, 2, '2024-03-01'),
(6, 4, '2024-03-05'),
(7, 5, '2024-03-10'),
(8, 3, '2024-03-15'),
(9, 1, '2024-03-20'),
(10, 4, '2024-03-25'),
(1, 2, '2024-04-01'),
(2, 3, '2024-04-03'),
(11, 1, '2024-04-05'),
(11, 2, '2024-04-10');
