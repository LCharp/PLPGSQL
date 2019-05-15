DROP FUNCTION  IF EXISTS  req6(varchar,varchar);
CREATE FUNCTION req6(in ch varchar, in sep varchar) returns setof varchar  AS $$
declare 
	pos integer;
	l integer;
	sch varchar;
BEGIN
	
	pos=-1;
	while pos<>0 loop
		pos = position(sep in ch);
		l=char_length(ch);
		if pos <> 0 then
			sch := substring(ch from 1 for pos-1);
		else
			sch := ch;
		end if;
		if char_length(sch) <>0 then
			return next sch;
		end if;
		ch:= substring(ch from pos+1  for l-pos);
	end loop;
END
$$ language plpgsql;


select * from req6('____a_b_c_dd___','_');

