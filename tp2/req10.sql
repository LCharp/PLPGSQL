drop function if exists tp2_req9(integer, varchar, varchar, varchar, varchar);

create function tp2_req9 (chiffre integer, largeur varchar, couleur_tete varchar, couleur_l1 varchar, couleur_l2 varchar) returns varchar AS $$
declare
	i integer;
	tableau varchar;
	couleur varchar;
BEGIN
	tableau:='<table border="3" width="'||largeur||'">';
	tableau:=tableau||'<tr bgcolor="'||couleur_tete||'" align="center"><td>A</td><td>B</td><td>A*B</td></tr>';
	for i in 1 .. 10 loop
		couleur:=couleur_l1;
		if i % 2 = 0 then
			ccouleur: = couleur_l2;
		end if;
		tableau:=tableau||('<tr bgcolor="'||couleur||'" align="right"><td>' || i || '</td><td>' || chiffre || '</td><td>' || i*chiffre || '</td></tr>');
	end loop;
	tableau:=tableau||'</table>';
	RETURN tableau;
END
$$ language plpgsql;
