drop function if exists req9();
create function req9(integer) RETURNS SETOF varchar AS $$
DECLARE 
	i integer;
	ligne varchar;
BEGIN
		FOR i in 0 .. 10 LOOP
			ligne := concat(ligne, i*$1, );
		END LOOP;
		return next ligne;
END
$$ language plpgsql;


select * from req9(56468465);
