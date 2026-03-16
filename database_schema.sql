-- =========================
-- DATABASE SCHEMA + DATA 
-- =========================

CREATE TABLE Passenger (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    country VARCHAR(50),
    passport_number VARCHAR(20),
    email VARCHAR(50)
);

CREATE TABLE Trip (
    id INT PRIMARY KEY,
    town_from VARCHAR(50) NOT NULL,
    town_to VARCHAR(50) NOT NULL,
    flight_number VARCHAR(10),
    airline VARCHAR(50),
    departure_time DATETIME,
    arrival_time DATETIME
);

CREATE TABLE Pass_in_trip (
    passenger INT NOT NULL,
    trip INT NOT NULL,
    date DATE NOT NULL,
    seat_number VARCHAR(5),
    ticket_class VARCHAR(10),
    price DECIMAL(10,2),
    PRIMARY KEY (passenger, trip, date),
    FOREIGN KEY (passenger) REFERENCES Passenger(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (trip) REFERENCES Trip(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- =========================
-- Пассажиры
-- =========================
INSERT INTO Passenger (id, name, age, country, passport_number, email) VALUES
(1, 'Thibaut Courtois', 32, 'Belgium', 'B1234567', 'courtois@example.com'),
(2, 'Dani Carvajal', 31, 'Spain', 'S7654321', 'carvajal@example.com'),
(3, 'David Alaba', 31, 'Austria', 'A1122334', 'alaba@example.com'),
(4, 'Éder Militão', 25, 'Brazil', 'BR998877', 'militao@example.com'),
(5, 'Antonio Rüdiger', 30, 'Germany', 'D445566', 'ruediger@example.com'),
(6, 'Ferland Mendy', 27, 'France', 'F223344', 'mendy@example.com'),
(7, 'Luka Modric', 38, 'Croatia', 'C556677', 'modric@example.com'),
(8, 'Toni Kroos', 33, 'Germany', 'D778899', 'kroos@example.com'),
(9, 'Eduardo Camavinga', 21, 'France', 'F334455', 'camavinga@example.com'),
(10, 'Aurélien Tchouaméni', 23, 'France', 'F667788', 'tchouameni@example.com'),
(11, 'Vinícius Júnior', 22, 'Brazil', 'BR112244', 'vinicius@example.com'),
(12, 'Kylian Mbappe', 25, 'France', 'F889900', 'mbappe@example.com');

-- =========================
-- Рейсы
-- =========================
INSERT INTO Trip (id, town_from, town_to, flight_number, airline, departure_time, arrival_time) VALUES
(1, 'Madrid', 'London', 'IB101', 'Iberia', '2024-01-10 08:00:00', '2024-01-10 10:30:00'),
(2, 'Madrid', 'Paris', 'AF202', 'Air France', '2024-02-05 09:00:00', '2024-02-05 11:15:00'),
(3, 'Madrid', 'Berlin', 'LH303', 'Lufthansa', '2024-02-12 07:30:00', '2024-02-12 10:00:00'),
(4, 'Madrid', 'Rome', 'AZ404', 'Alitalia', '2024-03-05 10:00:00', '2024-03-05 12:30:00'),
(5, 'Madrid', 'New York', 'DL505', 'Delta', '2024-03-10 15:00:00', '2024-03-10 23:00:00');

-- =========================
-- Полёты пассажиров
-- =========================
INSERT INTO Pass_in_trip (passenger, trip, date, seat_number, ticket_class, price) VALUES
(1, 1, '2024-01-10', '1A', 'Business', 350.00),
(2, 1, '2024-01-10', '1B', 'Business', 350.00),
(3, 2, '2024-02-05', '12C', 'Economy', 120.00),
(4, 3, '2024-02-12', '14D', 'Economy', 150.00),
(5, 2, '2024-03-01', '12A', 'Economy', 120.00),
(6, 4, '2024-03-05', '2C', 'Business', 400.00),
(7, 5, '2024-03-10', '3B', 'First', 800.00),
(8, 3, '2024-03-15', '15F', 'Economy', 150.00),
(9, 1, '2024-03-20', '11D', 'Economy', 130.00),
(10, 4, '2024-03-25', '4A', 'Business', 400.00),
(11, 2, '2024-04-01', '13C', 'Economy', 120.00),
(12, 5, '2024-04-02', '3C', 'First', 800.00),
(1, 3, '2024-04-03', '1C', 'Business', 150.00),
(2, 5, '2024-04-05', '2D', 'First', 800.00),
(3, 4, '2024-04-10', '12B', 'Economy', 150.00);
