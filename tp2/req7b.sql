drop function if exists tp2_req7b(varchar);

create function tp2_req7b( in mot varchar) returns boolean AS $$
declare
	curseur refcursor;
	ligne record;
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
		if substring(mot from 3 for 1) <> '-' or substring(mot from 7 for 1) <> '-' then
			valide := false;
		else
			lettre := substring(mot from 1 for 2) || substring(mot from 8 for 2);
			chiffre := substring(mot from 4 for 3);
			open curseur for select * from tp2_req4(lettre);
			fetch curseur into ligne;
			close curseur;
			if ligne.nb_maj<>4 then
				valide:= false;
			end if;
			open curseur for select * from tp2_req6(chiffre) as nb_chiffre;
			fetch curseur into ligne;
			if ligne.nb_chiffre <> 3 then
				valide:= false;
			end if;
		end if;
	end if;
	return valide;
END
$$ language plpgsql;

select * from tp2_req7b('AA-123-BB');
