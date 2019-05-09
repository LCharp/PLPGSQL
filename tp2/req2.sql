drop function if exists tp2_req2(varchar);

create function tp2_req2(mot varchar) RETURNS integer AS $$
declare
	i integer;
	nb_cons integer;
	long_mot integer;
	lettre varchar;
BEGIN
	nb_cons = 0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= substring(mot from i for 1);
		if not lettre in ('a','e','i','o','u','y') then
			nb_cons:=nb_cons+1;
		end if;
	end loop;
	return nb_cons;

END
$$ language plpgsql;

select * from tp2_req2('aurelien');