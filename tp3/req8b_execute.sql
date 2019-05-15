DROP FUNCTION  IF EXISTS  tp3_req8b(varchar);
CREATE FUNCTION tp3_req8b(in col varchar) returns varchar  AS $$
declare

	curs refcursor;
	l record;
	res varchar;
BEGIN

		open curs for execute 'select nom_fichier, to_char(date_mel,''dd/mm/yyyy'') as date_mel,
		        ' || col || '  as c3
				from t_image
				inner join t_internaute on t_image.num_internaute=t_internaute.num_internaute';


	res:='<table border="3">';
	res:=res||'<tr><td>Fichier</td><td>Date</td><td>Internaute</td></tr>';
	fetch curs into l;
	while (found) loop
		res:=res||'<tr><td>'||l.nom_fichier||'</td><td>'||l.date_mel||'</td><td>'||l.c3||'</td></tr>';
		fetch curs into l;
	end loop;
	res:=res||'</table>';
	return res;
END
$$ language plpgsql;


select * from tp3_req8b('login');
