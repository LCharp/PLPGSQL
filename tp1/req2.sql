drop function if exists date_us();
create function date_us ( ) returns  varchar AS $$
BEGIN
	return now();
END
$$ language plpgsql;


select * from date_us();
