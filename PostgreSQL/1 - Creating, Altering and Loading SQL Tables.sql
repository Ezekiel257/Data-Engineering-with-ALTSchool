-- day, airline_name, airline_code, flight_number,
-- origin_airport, origin_state, origin_state, 
-- destination_airport, destination_city, destination_state, 
-- scheduled_flight_time, scheduled_departure_time, scheduled_arrival_time, 
-- actual_flight_time, actual_departure_time, actual_arrival_time
-- was_cancelled
-- cancellation_reason


-- create flight table
create table public.flights (
	id serial primary key,
	airline_name text,
	airline_code varchar(10),
	flight_number int,
	origin_airport varchar(10),
	origin_city text,
	origin_state text,
	destination_airport varchar(10),
	destination_city text,
	destination_state text,
	scheduled_flight_time int,
	scheduled_departure_time int,
	scheduled_arrival_time int,
	actual_flight_time int,
	actual_arrival_time int,
	distance numeric,
	was_cancelled boolean,
	cancellation_reason text,
	day timestamp
);


-- To add new fields to already existing table.
-- air_time, air_traffic_delay, arrival_delay, carrier_delay, departure_delay
-- late_aircraft_delay
-- security_delay, weather_delay
-- wheels_off_time, wheels_on_time
-- day_of_week

alter table public.flights 
add column air_time int default 0,
add column air_traffic_delay int default 0,
add column arrival_delay int default 0,
add column carrier_delay int default 0,
add column departure_delay int default 0,
add column late_aircraft_delay int default 0,
add column security_delay int default 0,
add column weather_delay int default 0,
add column wheels_off_time int default 0,
add column wheels_on_time int default 0,
add column day_of_week varchar(15);


-- Now lets load Data into the Database.

-- run a select statement
select * from public.flights;

select distinct airline_name
from public.flights;

select  id, airline_name, airline_code, flight_number, origin_airport,
		origin_city, origin_state
from public.flights
limit 5;











