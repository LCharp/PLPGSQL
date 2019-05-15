DROP FUNCTION  IF EXISTS tp3_req7(varchar,int,varchar);

CREATE FUNCTION tp3_req7(in fic varchar, in internaute integer, lstt varchar) returns setof varchar  AS $$
declare dj date;
	num_img integer;
	curs refcursor;
	l record;
BEGIN
	dj := now();
	insert into t_image (nom_fichier, date_mel, num_internaute) values (fic, dj, internaute) 
	            returning num_image into num_img;
	open curs for select * from req6_regex(lstt, '_') as v;
	fetch curs into l;
	while found loop
		insert into t_correspondre (num_image, num_theme) values (num_img, l.v::integer);
		return next 'enreg de '|| l.v || '<br />';
		fetch curs into l;	
	end loop;
		
END
$$ language plpgsql;

