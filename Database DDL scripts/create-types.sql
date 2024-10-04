-- DROP TYPE public.day_of_week;

CREATE TYPE public.day_of_week AS ENUM (
	'Monday',
	'Tuesday',
	'Wednesday',
	'Thursday',
	'Friday',
	'Saturday',
	'Sunday');

-- DROP TYPE public.in_out_enum;

CREATE TYPE public.in_out_enum AS ENUM (
	'in',
	'out');

-- DROP TYPE public."_day_of_week";

CREATE TYPE public."_day_of_week" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.day_of_week,
	DELIMITER = ',');

-- DROP TYPE public."_in_out_enum";

CREATE TYPE public."_in_out_enum" (
	INPUT = array_in,
	OUTPUT = array_out,
	RECEIVE = array_recv,
	SEND = array_send,
	ANALYZE = array_typanalyze,
	ALIGNMENT = 4,
	STORAGE = any,
	CATEGORY = A,
	ELEMENT = public.in_out_enum,
	DELIMITER = ',');