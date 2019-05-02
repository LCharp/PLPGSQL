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
