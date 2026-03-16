CREATE TABLE Passenger (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Trip (
    id INT PRIMARY KEY,
    town_from VARCHAR(50),
    town_to VARCHAR(50)
);

CREATE TABLE Pass_in_trip (
    passenger INT,
    trip INT,
    date DATE
);
-- пассажиры
INSERT INTO Passenger (id, name) VALUES
(1, 'John Smith'),
(2, 'Alice Brown'),
(3, 'David Lee');

-- рейсы
INSERT INTO Trip (id, town_from, town_to) VALUES
(1, 'Paris', 'London'),
(2, 'London', 'New York'),
(3, 'Paris', 'Berlin');

-- кто летел
INSERT INTO Pass_in_trip (passenger, trip, date) VALUES
(1, 1, '2024-01-10'),
(1, 2, '2024-02-15'),
(2, 1, '2024-03-05'),
(3, 3, '2024-01-20');
