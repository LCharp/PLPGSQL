DROP FUNCTION  IF EXISTS  req6_regex (varchar,varchar);

CREATE FUNCTION req6_regex (in ch varchar, in sep varchar) returns setof varchar  AS $$
declare 
	curs refcursor;
	l record;
BEGIN
	open curs for select * from regexp_split_to_table(ch,sep) as v;
	fetch curs into l;
	while found loop
		if l.v <> '' then
			return next l.v;
		end if;
		fetch curs into l;
	end loop;
END
$$ language plpgsql;

select * from req6_regex('___aa_b____c_dd___','_');

