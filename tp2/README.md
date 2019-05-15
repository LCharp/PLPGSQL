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
###### Req 2:  ######

```sql
drop function if exists tp2_req2(varchar);

create function tp2_req2(mot varchar) RETURNS integer AS $$
declare
	i integer;
	nb_cons integer;
	long_mot integer;
	lettre varchar;
BEGIN
	nb_cons = 0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= substring(mot from i for 1);
		if not lettre in ('a','e','i','o','u','y') then
			nb_cons:=nb_cons+1;
		end if;
	end loop;
	return nb_cons;

END
$$ language plpgsql;

select * from tp2_req2('aurelien');
```
###### Req 3:  ######

```sql
drop function if exists tp2_req3(varchar);

create function tp2_req3( in mot varchar, out nb_voy integer, out nb_cons integer) AS $$
declare
	i integer;
	long_mot integer;
	lettre varchar;
BEGIN
	nb_cons := 0;
	nb_voy := 0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= substring(mot from i for 1);
		if ascii(lettre) >=97 and ascii (lettre) <=122 then
			if lettre in ('a','e','i','o','u','y') then
				nb_voy:=nb_voy+1;
			else
				nb_cons:=nb_cons+1;
			end if;
		end if;
	end loop;

END
$$ language plpgsql;

select * from tp2_req3('aurelien');
```
###### Req 3b:  ######

```sql
drop function if exists tp2_req3bis(varchar);

create function tp2_req3bis( in mot varchar, out nb_voy integer, out nb_cons integer) AS $$
declare
	i integer;
	long_mot integer;
	lettre varchar;
BEGIN
	nb_voy:=tp2_req1(mot);
	nb_cons:=tp2_req2(mot);
END
$$ language plpgsql;

select * from tp2_req3bis('aurelien');
```
###### Req 4:  ######

```sql
drop function if exists tp2_req4(varchar);

create function tp2_req4( in mot varchar, out nb_maj integer, out nb_min integer) AS $$
declare
	i integer;
	long_mot integer;
	lettre integer;
BEGIN
	nb_maj := 0;
	nb_min := 0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= ascii(substring(mot from i for 1));
		if lettre >= 65 and lettre <= 90 then
				nb_maj:=nb_maj+1;
			elseif lettre >= 97 and lettre <= 122 then
				nb_min:=nb_min+1;
			end if;
	end loop;

END
$$ language plpgsql;

select * from tp2_req4('auRElien');
```
###### Req 5:  ######

```sql
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
```
###### Req 5b:  ######

```sql
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
```
###### Req 6:  ######

```sql
drop function if exists tp2_req6(varchar);

create function tp2_req6( in mot varchar) returns integer AS $$
declare
	i integer;
	long_mot integer;
	lettre char;
	nb_chiffre integer;
BEGIN
	nb_chiffre:=0;
	long_mot = char_length(mot);
	for i in 1 .. long_mot loop
		lettre:= substring(mot from i for 1);
		if lettre >= '0' and lettre <= '9' then
				nb_chiffre:=nb_chiffre+1;
			end if;
	end loop;
	return nb_chiffre;

END
$$ language plpgsql;

select * from tp2_req6('4uR3l1en');
```
###### Req 7:  ######

```sql
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
```

###### Req 7b:  ######

```sql
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
```

###### Req 8:  ######

```php
<?php
	function connect()
		{
			$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
			return($idc);
		}
	$idc=connect();
	$sql='select tp2_req8 as chiffre from tp2_req8(6)';
	$res1 = pg_exec($idc,$sql);
	$ligne=pg_fetch_assoc($res1);
	print ($ligne['chiffre']);
?>
```
```sql
drop function if exists tp2_req8(integer);

create function tp2_req8 (chiffre integer) returns varchar AS $$
declare
	i integer;
	tableau varchar;
BEGIN
	tableau:='<table border="3">';
	tableau:=tableau||'<tr><td>A</td><td>B</td><td>A*B</td></tr>';
	for i in 1 .. 10 loop
		tableau:=tableau||('<tr><td>' || i || '</td><td>' || chiffre || '</td><td>' || i*chiffre || '</td></tr>');
	end loop;
	tableau:=tableau||'</table>';
	RETURN tableau;
END
$$ language plpgsql;
```

###### Req 9:  ######

```php
<?php
	function connect()
		{
			$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
			return($idc);
		}
	$idc=connect();
	$sql='select tp2_req9 as chiffre from tp2_req9(6,\'30%\')';
	$rs = pg_exec($idc,$sql);
	$ligne=pg_fetch_assoc($rs);
	print ($ligne['chiffre']);
?>
```
```sql
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
