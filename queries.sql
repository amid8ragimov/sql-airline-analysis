-- количество полетов каждого пассажира

SELECT p.name, COUNT(*) AS flights
FROM Passenger p
JOIN Pass_in_trip pit ON p.id = pit.passenger
GROUP BY p.name
ORDER BY flights DESC;
