-- =========================
-- DATABASE SCHEMA + DATA
-- =========================

CREATE TABLE Passenger (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Trip (
    id INT PRIMARY KEY,
    town_from VARCHAR(50) NOT NULL,
    town_to VARCHAR(50) NOT NULL
);

CREATE TABLE Pass_in_trip (
    passenger INT NOT NULL,
    trip INT NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY (passenger, trip, date),
    FOREIGN KEY (passenger) REFERENCES Passenger(id) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY (trip) REFERENCES Trip(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- =========================
-- Пассажиры
-- =========================
INSERT INTO Passenger (id, name) VALUES
(1, 'Thibaut Courtois'),
(2, 'Dani Carvajal'),
(3, 'David Alaba'),
(4, 'Éder Militão'),
(5, 'Antonio Rüdiger'),
(6, 'Ferland Mendy'),
(7, 'Luka Modric'),
(8, 'Toni Kroos'),
(9, 'Eduardo Camavinga'),
(10, 'Aurélien Tchouaméni'),
(11, 'Vinícius Júnior'),
(12, 'Kylian Mbappe');

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
(11, 2, '2024-04-01'),
(12, 5, '2024-04-02'),
(1, 3, '2024-04-03'),
(2, 5, '2024-04-05'),
(3, 4, '2024-04-10');
