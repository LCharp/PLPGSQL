drop function if exists tp2_req1(varchar);

create function tp2_req1(mot varchar) RETURNS integer AS $$
declare
	i integer;
	nb_voy integer;
	long_mot integer;
	lettre varchar;
BEGIN
	nb_voy = 0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= substring(mot from i for 1);
		if lettre='a' or lettre='e' or lettre='i' or lettre='o' or lettre='u' or lettre='y' then
			nb_voy:=nb_voy+1;
		end if;
	end loop;
	return nb_voy;

END
$$ language plpgsql;

select * from tp2_req1('aurelien');
