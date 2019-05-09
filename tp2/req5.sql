drop function if exists tp2_req5(varchar);

create function tp2_req5( in mot varchar) returns boolean AS $$
declare
	i integer;
	long_mot integer;
	nb_maj integer;
BEGIN
	nb_maj:= 0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		if ascii(substring(mot from i for 1)) >= 65 and ascii(substring(mot from i for 1)) <= 90 then
				nb_maj:=nb_maj+1;
			end if;
	end loop;
	return nb_maj=4;

END
$$ language plpgsql;

select * from tp2_req5('auRELIEn');
