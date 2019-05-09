drop function if exists tp2_req5b(varchar);

create function tp2_req5b(in mot varchar) returns boolean AS $$
declare
	curseur refcursor;
	long_mot record;
BEGIN
	open curseur for select nb_maj from tp2_req4(mot);
	fetch curseur into long_mot;
	return long_mot.nb_maj=4;
END
$$ language plpgsql;

select * from tp2_req5b('auRELIEn');
