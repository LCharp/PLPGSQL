drop function if exists tp2_req3bis(varchar);

create function tp2_req3bis( in mot varchar, out nb_voy integer, out nb_cons integer) AS $$
declare
	i integer;
	long_mot integer;
	lettre varchar;
BEGIN
	nb_voy:=tp2_req1(mot);
	nb_cons:=tp2_req2(mot);
END
$$ language plpgsql;

select * from tp2_req3bis('aurelien');
