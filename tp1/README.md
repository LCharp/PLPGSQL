## TP 1 :

###### Req 1:  ######

```sql
drop function if exists helloworld();

CREATE FUNCTION helloworld() RETURNS varchar as $$
BEGIN
	return 'Hello world';
END
$$ LANGUAGE plpgsql

select * from helloworld()
```

###### Req 2:  ######

```sql
drop function if exists date_us();

create function date_us ( ) returns  varchar AS $$
BEGIN
	return now();
END
$$ language plpgsql;

select * from date_us();
```

###### Req 3:  ######

```sql
drop function if exists date_fr();

create function date_fr() returns  varchar AS $$
declare 
	date_us date;
	date_fr varchar;
BEGIN
	date_us := now();
	date_fr := to_char(date_us,'DD/MM/YYYY');
	return date_fr;
END
$$ language plpgsql;

select * from date_fr();
```

###### Req 4:  ######
```sql
drop function if exists req4();

create function req4 (integer, integer, OUT integer, OUT integer) AS $$
BEGIN
	$3:= $1*2;
	$4:= $2*3;
END
$$ language plpgsql;

select * from req4(5,4);
```

###### Req 5:  ######

```sql
drop function if exists req5(integer, integer, OUT varchar);

create function req5(integer, integer, OUT varchar) AS $$
BEGIN
	if $2 = 0 then
		$3:= 'Division par 0 impossible';
	ELSE
		$3:= round(($1::real/$2::real)::numeric,2);
	END IF;
END
$$ language plpgsql;

select * from req5(4,0);
```

###### Req 6a:  ######

```sql
drop function if exists req6(integer, integer, OUT varchar);

create function req6(integer, OUT varchar) AS $$
BEGIN
	if $1 > 0 AND $1 <= 4 then
		$2:= 'Ah !';
	elseif $1 > 4 AND $1 <= 8 then
		$2:= 'Lamentable !';
	elseif $1 > 8 AND $1 <= 12 then
		$2:= 'Gros Progrès !';
	elseif $1 > 12 AND $1 <= 16 then
		$2:= 'Oh !';
	elseif $1 > 16 AND $1 <= 20 then
		$2:= 'Super !';
	elseif $1 > 20 OR $1 < 0 then
		$2:= 'Erreur !';
	end if;
END
$$ language plpgsql;

select * from req6(-5);
```

###### Req 6b:  ######

```sql
drop function if exists req6b(integer, integer, OUT varchar);

create function req6b(integer, OUT varchar) AS $$
BEGIN
	CASE
	WHEN $1 BETWEEN 0 AND 4 Then
		$2:= 'Ah !';
	WHEN $1 BETWEEN 4 AND 8 Then
		$2:= 'Lamentable !';
	WHEN $1 BETWEEN 8 AND 12 Then
		$2:= 'Gros Progrès !';
	WHEN $1 BETWEEN 12 AND 16 Then
		$2:= 'Oh !';
	WHEN $1 BETWEEN 16  AND 20 Then
		$2:= 'Super !';
	WHEN $1 > 20 OR $1 < 0 Then
		$2:= 'Erreur !';
	end case;
END
$$ language plpgsql;

select * from req6b(155);
```

###### Req 7:  ######

```sql
drop function if exists req7();

create function req7() RETURNS SETOF varchar AS $$
DECLARE 
	i integer;
	result integer;
BEGIN
	FOR i in 0 .. 10 LOOP
		return next i*5;
	END LOOP;
END
$$ language plpgsql;

select * from req7();
```

###### Req 8:  ######

```sql
drop function if exists req8();

create function req8(integer) RETURNS SETOF varchar AS $$
DECLARE 
	i integer;
BEGIN
	if $1 > 0 then
		FOR i in 0 .. 10 LOOP
			return next i*$1;
		END LOOP;
	Else
		return next 'Nombre trop petit';
	end if;
END
$$ language plpgsql;

select * from req8(5);
```

###### Req 9:  ######

```sql
drop function if exists req8();

create function req8(integer) RETURNS SETOF varchar AS $$
DECLARE 
	i integer;
BEGIN
	if $1 > 0 then
		FOR i in 0 .. 10 LOOP
			return next i*$1;
		END LOOP;
	Else
		return next 'Nombre trop petit';
	end if;
END
$$ language plpgsql;

select * from req8(5);
```

###### Req 10:  ######

```php
<?php
	$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
	$sql='select * from date_fr()';
	$rs=pg_exec($idc,$sql);
	$ligne=pg_fetch_assoc($rs);
	/*
	foreach($ligne as $cle=>$valeur)
	{
		print ($cle.' '.$valeur. 'fin<br />');
	}
	 */
	print($ligne['date_fr']);
?>
```
###### Req 11:  ######

```php
<?php
	$idc = pg_connect('host= user= password= dbname=');
	$sql='select * from req8(5)';
	$rs=pg_exec($idc,$sql);
	$ligne=pg_fetch_assoc($rs);
	
	while($ligne=pg_fetch_assoc($rs))
	{
		print ($ligne['req8'].'<br />');
	}
?>
```

###### Req 12:  ######

```php
<?php
	$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
	$sql='select * from req9(5)';
	$rs=pg_exec($idc,$sql);
	$ligne=pg_fetch_assoc($rs);
	
	print ($ligne['req9']);
?>
```
