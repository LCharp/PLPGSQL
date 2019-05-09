drop function if exists tp2_req4(varchar);

create function tp2_req4( in mot varchar, out nb_maj integer, out nb_min integer) AS $$
declare
	i integer;
	long_mot integer;
	lettre integer;
BEGIN
	nb_maj := 0;
	nb_min := 0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= ascii(substring(mot from i for 1));
		if lettre >= 65 and lettre <= 90 then
				nb_maj:=nb_maj+1;
			elseif lettre >= 97 and lettre <= 122 then
				nb_min:=nb_min+1;
			end if;
	end loop;

END
$$ language plpgsql;

select * from tp2_req4('auRElien');
