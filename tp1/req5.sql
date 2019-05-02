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
