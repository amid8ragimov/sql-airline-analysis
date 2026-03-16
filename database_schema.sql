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
