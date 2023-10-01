

-- Logical and Conditional Operators

-- Logical Operators: LIKE, IN, BETWEEN, AND, OR, IS NULL, NOT


-- Example 1: Query all airline name with airline text

select *
from public.flights
where airline_name ilike '%airlines%';


-- Example 2: Query all flight with flight_number between 2500 and 3000
select *
from public.flights
where flight_number between 2500 and 3000
order by flight_number desc;
