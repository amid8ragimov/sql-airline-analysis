-- =====================================
-- SQL Queries for Airline Analysis Project
-- =====================================

-- 1. Количество полётов каждого пассажира
SELECT p.name, COUNT(*) AS flights
FROM Passenger p
JOIN Pass_in_trip pit ON p.id = pit.passenger
GROUP BY p.name
ORDER BY flights DESC;

-- 2. Самые популярные направления (по количеству пассажиров)
SELECT t.town_to, COUNT(pit.passenger) AS passengers
FROM Trip t
JOIN Pass_in_trip pit ON t.id = pit.trip
GROUP BY t.town_to
ORDER BY passengers DESC;

-- 3. Пассажиры, которые летали больше одного раза
SELECT p.name, COUNT(*) AS flights
FROM Passenger p
JOIN Pass_in_trip pit ON p.id = pit.passenger
GROUP BY p.name
HAVING COUNT(*) > 1;

-- 4. Количество пассажиров на каждом рейсе
SELECT t.id, t.town_from, t.town_to, COUNT(pit.passenger) AS passengers
FROM Trip t
JOIN Pass_in_trip pit ON t.id = pit.trip
GROUP BY t.id, t.town_from, t.town_to
ORDER BY passengers DESC;

-- 5. Из каких городов больше всего вылетов
SELECT town_from, COUNT(*) AS flights
FROM Trip
GROUP BY town_from
ORDER BY flights DESC;

-- 6. Все полёты с именами пассажиров
SELECT p.name, t.town_from, t.town_to, pit.date
FROM Passenger p
JOIN Pass_in_trip pit ON p.id = pit.passenger
JOIN Trip t ON pit.trip = t.id
ORDER BY pit.date;

-- 7. Рейсы, где летал Мбаппе
SELECT t.town_from, t.town_to, pit.date
FROM Passenger p
JOIN Pass_in_trip pit ON p.id = pit.passenger
JOIN Trip t ON pit.trip = t.id
WHERE p.name = 'Kylian Mbappe';

-- 8. Пассажиры, которые летали в Париж
SELECT p.name, t.date
FROM Passenger p
JOIN Pass_in_trip pit ON p.id = pit.passenger
JOIN Trip t ON pit.trip = t.id
WHERE t.town_to = 'Paris';

-- 9. Сколько рейсов в каждый город делал каждый пассажир
SELECT p.name, t.town_to, COUNT(*) AS flights
FROM Passenger p
JOIN Pass_in_trip pit ON p.id = pit.passenger
JOIN Trip t ON pit.trip = t.id
GROUP BY p.name, t.town_to
ORDER BY p.name, flights DESC;

-- 10. Пассажиры, которые летали одновременно на одном рейсе (совпадения)
SELECT t.id AS trip_id, t.town_from, t.town_to, GROUP_CONCAT(p.name) AS passengers
FROM Trip t
JOIN Pass_in_trip pit ON t.id = pit.trip
JOIN Passenger p ON pit.passenger = p.id
GROUP BY t.id, t.town_from, t.town_to
HAVING COUNT(p.id) > 1;
