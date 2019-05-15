DROP FUNCTION  IF EXISTS  req8(varchar);
CREATE FUNCTION req8(in col varchar) returns varchar  AS $$
declare 

	curs refcursor;
	l record;
	res varchar;
BEGIN
	if col = 'login' then
		open curs for select nom_fichier, to_char(date_mel,'dd/mm/yyyy') as date_mel,  login  as c3
				from t_image
				inner join t_internaute on t_image.num_internaute=t_internaute.num_internaute;
	else
		open curs for select nom_fichier, to_char(date_mel,'dd/mm/yyyy') as date_mel,  nom_internaute  as c3
				from t_image
				inner join t_internaute on t_image.num_internaute=t_internaute.num_internaute;
	end if;

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

select * from req8('login');
