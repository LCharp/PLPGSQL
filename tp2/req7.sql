drop function if exists tp2_req7(varchar);

create function tp2_req7( in mot varchar) returns boolean AS $$
declare
	valide boolean;
	i integer;
	long_mot integer;
	lettre varchar;
	chiffre varchar;
BEGIN
	valide = true;
	long_mot = char_length(mot);
	if long_mot <> 9 then
		valide:=false;
	else
	lettre := substring(mot from 1 for 2) || substring(mot from 8 for 2);
	chiffre := substring(mot from 4 for 3);
		for i in 1 .. 4 loop
			if ascii(substring (lettre from i for 1)) < 65 or
					ascii(substring (lettre from i for 1)) > 90 then
				valide := false;
			end if;
		end loop;
		for i in 1 .. 3 loop
			if ascii(substring (chiffre from i for 1)) < 48 or
				 ascii(substring (chiffre from i for 1)) > 57 then
				valide := false;
			end if;
		end loop;
	end if;
	return valide;
END
$$ language plpgsql;

select * from tp2_req7('AA-123-BB');
