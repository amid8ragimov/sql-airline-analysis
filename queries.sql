-- =========================
--  ANALYTIC QUERIES
-- =========================

-- 1. Количество рейсов для каждого пассажира
SELECT p.name, COUNT(*) AS flight_count
FROM Pass_in_trip pit
JOIN Passenger p ON pit.passenger = p.id
GROUP BY p.id, p.name
ORDER BY flight_count DESC;

-- 2. Популярные направления (город назначения)
SELECT t.town_to, COUNT(*) AS passengers_count
FROM Pass_in_trip pit
JOIN Trip t ON pit.trip = t.id
GROUP BY t.town_to
ORDER BY passengers_count DESC;

-- 3. Пассажиры с более чем 1 рейсом
SELECT p.name, COUNT(*) AS flights
FROM Pass_in_trip pit
JOIN Passenger p ON pit.passenger = p.id
GROUP BY p.id, p.name
HAVING COUNT(*) > 1;

-- 4. Количество пассажиров на каждом рейсе
SELECT t.id AS trip_id, t.town_from, t.town_to, COUNT(*) AS passenger_count
FROM Pass_in_trip pit
JOIN Trip t ON pit.trip = t.id
GROUP BY t.id, t.town_from, t.town_to
ORDER BY passenger_count DESC;

-- 5. Полная история рейсов конкретного пассажира
-- Пример: Kylian Mbappe
SELECT p.name, t.town_from, t.town_to, pit.date, pit.seat_number, pit.ticket_class, pit.price
FROM Pass_in_trip pit
JOIN Passenger p ON pit.passenger = p.id
JOIN Trip t ON pit.trip = t.id
WHERE p.name = 'Kylian Mbappe'
ORDER BY pit.date;

-- 6. Пассажиры, летавшие в конкретный город
-- Пример: Paris
SELECT DISTINCT p.name
FROM Pass_in_trip pit
JOIN Passenger p ON pit.passenger = p.id
JOIN Trip t ON pit.trip = t.id
WHERE t.town_to = 'Paris';

-- 7. Количество рейсов по городам и класс билета для каждого пассажира
SELECT p.name, t.town_to, pit.ticket_class, COUNT(*) AS flights_to_city
FROM Pass_in_trip pit
JOIN Passenger p ON pit.passenger = p.id
JOIN Trip t ON pit.trip = t.id
GROUP BY p.id, t.town_to, pit.ticket_class
ORDER BY p.name, flights_to_city DESC;

-- 8. Пассажиры, летавшие вместе на одном рейсе
SELECT t.id AS trip_id, t.town_from, t.town_to,
       GROUP_CONCAT(p.name ORDER BY p.name SEPARATOR ', ') AS passengers,
       t.flight_number, t.airline
FROM Pass_in_trip pit
JOIN Passenger p ON pit.passenger = p.id
JOIN Trip t ON pit.trip = t.id
GROUP BY t.id, t.town_from, t.town_to, t.flight_number, t.airline
ORDER BY t.id;

-- 9. Топ 5 самых дорогих билетов и пассажиры
SELECT p.name, t.town_from, t.town_to, pit.price, pit.ticket_class, t.airline
FROM Pass_in_trip pit
JOIN Passenger p ON pit.passenger = p.id
JOIN Trip t ON pit.trip = t.id
ORDER BY pit.price DESC
LIMIT 5;

-- 10. Средняя стоимость билета по направлениям
SELECT t.town_from, t.town_to, AVG(pit.price) AS avg_price
FROM Pass_in_trip pit
JOIN Trip t ON pit.trip = t.id
GROUP BY t.town_from, t.town_to
ORDER BY avg_price DESC;

-- 11. Список всех пассажиров с их страной и количеством рейсов
SELECT p.name, p.country, COUNT(*) AS flights_count
FROM Pass_in_trip pit
JOIN Passenger p ON pit.passenger = p.id
GROUP BY p.id, p.name, p.country
ORDER BY flights_count DESC;

-- 12. Рейсы и пассажиры бизнес-класса
SELECT t.town_from, t.town_to, p.name, pit.seat_number, pit.price
FROM Pass_in_trip pit
JOIN Passenger p ON pit.passenger = p.id
JOIN Trip t ON pit.trip = t.id
WHERE pit.ticket_class = 'Business'
ORDER BY t.town_to, p.name;
