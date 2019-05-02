drop function if exists req4();
create function req4 (integer, integer, OUT integer, OUT integer) AS $$
BEGIN
	$3:= $1*2;
	$4:= $2*3;
END
$$ language plpgsql;


select * from req4(5,4);
