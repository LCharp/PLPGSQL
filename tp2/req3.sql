drop function if exists tp2_req3(varchar);

create function tp2_req3( in mot varchar, out nb_voy integer, out nb_cons integer) AS $$
declare
	i integer;
	long_mot integer;
	lettre varchar;
BEGIN
	nb_cons := 0;
	nb_voy := 0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= substring(mot from i for 1);
		if ascii(lettre) >=97 and ascii (lettre) <=122 then
			if lettre in ('a','e','i','o','u','y') then
				nb_voy:=nb_voy+1;
			else
				nb_cons:=nb_cons+1;
			end if;
		end if;
	end loop;

END
$$ language plpgsql;

select * from tp2_req3('aurelien');
