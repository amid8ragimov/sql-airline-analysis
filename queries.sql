-- количество полетов каждого пассажира

SELECT p.name, COUNT(*) AS flights
FROM Passenger p
JOIN Pass_in_trip pit ON p.id = pit.passenger
GROUP BY p.name
ORDER BY flights DESC;

-- Самые популярные направления

SELECT town_to, COUNT(*) AS flights
FROM Trip
JOIN Pass_in_trip pit ON Trip.id = pit.trip
GROUP BY town_to
ORDER BY flights DESC;

-- Пассажиры которые летали больше 1 раза

SELECT p.name, COUNT(*) AS flights
FROM Passenger p
JOIN Pass_in_trip pit ON p.id = pit.passenger
GROUP BY p.name
HAVING COUNT(*) > 1;
