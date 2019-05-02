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
