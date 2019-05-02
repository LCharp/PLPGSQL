drop function if exists date_fr();
create function date_fr() returns  varchar AS $$
declare 
	date_us date;
	date_fr varchar;
BEGIN
	date_us := now();
	date_fr := to_char(date_us,'DD/MM/YYYY');
	return date_fr;
END
$$ language plpgsql;


select * from date_fr();
