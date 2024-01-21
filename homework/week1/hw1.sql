-- General
SELECT *
FROM green_taxi_data
LIMIT 5;

SELECT *
FROM zones
LIMIT 5;

--Q3
SELECT COUNT(DISTINCT(index))
FROM green_taxi_data
WHERE lpep_pickup_datetime >= '2019-09-18 00:00:00'
AND lpep_dropoff_datetime <= '2019-09-18 23:59:59'

--Q4
SELECT lpep_pickup_datetime, (lpep_dropoff_datetime - lpep_pickup_datetime) as time
FROM green_taxi_data
WHERE EXTRACT(Month FROM lpep_pickup_datetime) = 9.0
ORDER BY time DESC;

--Q5
SELECT zones."Borough", SUM(total_amount) as total_amnt
FROM zones
INNER JOIN green_taxi_data gtd ON zones."LocationID" = gtd."PULocationID"
WHERE gtd.lpep_pickup_datetime BETWEEN '2019-09-18 00:00:00' AND '2019-09-18 23:59:59'
GROUP BY zones."Borough"
HAVING SUM(total_amount) > 50000.0;

--Q6
SELECT grd."DOLocationID", zs."Zone"
FROM zones zs
INNER JOIN green_taxi_data grd ON zs."LocationID" = grd."DOLocationID"
WHERE grd.tip_amount = (SELECT MAX(gr.tip_amount)
						FROM zones zn
						INNER JOIN green_taxi_data gr ON zn."LocationID" = gr."PULocationID"
						WHERE zn."Zone" = 'Astoria')
