drop function if exists req8();
create function req8(integer) RETURNS SETOF varchar AS $$
DECLARE 
	i integer;
BEGIN
	if $1 > 0 then
		FOR i in 0 .. 10 LOOP
			return next i*$1;
		END LOOP;
	Else
		return next 'Nombre trop petit';
	end if;
END
$$ language plpgsql;


select * from req8(5);
