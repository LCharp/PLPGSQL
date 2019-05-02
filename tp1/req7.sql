drop function if exists req7();
create function req7() RETURNS SETOF varchar AS $$
DECLARE 
	i integer;
	result integer;
BEGIN
	FOR i in 0 .. 10 LOOP
		return next i*5;
	END LOOP;
END
$$ language plpgsql;


select * from req7();
