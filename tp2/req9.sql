drop function if exists tp2_req9(integer, varchar);

create function tp2_req9 (chiffre integer, largeur varchar) returns varchar AS $$
declare
	i integer;
	tableau varchar;
BEGIN
	tableau:='<table border="3" width="'||largeur||'">';
	tableau:=tableau||'<tr><td>A</td><td>B</td><td>A*B</td></tr>';
	for i in 1 .. 10 loop
		tableau:=tableau||('<tr><td>' || i || '</td><td>' || chiffre || '</td><td>' || i*chiffre || '</td></tr>');
	end loop;
	tableau:=tableau||'</table>';
	RETURN tableau;
END
$$ language plpgsql;
