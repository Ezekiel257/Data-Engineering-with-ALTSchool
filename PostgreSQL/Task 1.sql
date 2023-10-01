

-- TASK 1: What other destination cities did the airline named “Hawaiian Airlines Inc.” have flights to aside from Pago Pago?

-- TASK 2: How many flights were made to the destination city of Pago Pago?


-- SOLUTION 1:

select distinct  destination_city 
from public.flights
where airline_name = 'Hawaiian Airlines Inc.' and destination_city != 'Pago Pago';


-- SOLUTION 2:
select count(*) as "No. of Flight"
from public.flights
where destination_city = 'Pago Pago';