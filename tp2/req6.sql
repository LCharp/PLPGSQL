drop function if exists tp2_req6(varchar);

create function tp2_req6( in mot varchar) returns integer AS $$
declare
	i integer;
	long_mot integer;
	lettre char;
	nb_chiffre integer;
BEGIN
	nb_chiffre:=0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= substring(mot from i for 1);
		if lettre >= '0' and lettre <= '9' then
				nb_chiffre:=nb_chiffre+1;
			end if;
	end loop;
	return nb_chiffre;

END
$$ language plpgsql;

select * from tp2_req6('4uR3l1en');
