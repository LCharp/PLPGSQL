## TP 2 :

###### Req 1:  ######

```sql
drop function if exists tp2_req1(varchar);

create function tp2_req1(mot varchar) RETURNS integer AS $$
declare
	i integer;
	nb_voy integer;
	long_mot integer;
	lettre varchar;
BEGIN
	nb_voy = 0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= substring(mot from i for 1);
		if lettre='a' or lettre='e' or lettre='i' or lettre='o' or lettre='u' or lettre='y' then
			nb_voy:=nb_voy+1;
		end if;
	end loop;
	return nb_voy;

END
$$ language plpgsql;

select * from tp2_req1('aurelien');
```

###### Req 10:  ######

```php
<?php
    function connect()
      {
        $idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
        return($idc);
      }
    $idc=connect();
    $sql='select tp2_req10 as chiffre from tp2_req10(6,\'30%\',\'blue\',\'green\',\'yellow\')';
    $rs = pg_exec($idc,$sql);
    $ligne=pg_fetch_assoc($rs);
    print ($ligne['chiffre']);
?>
```
```sql
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
```
