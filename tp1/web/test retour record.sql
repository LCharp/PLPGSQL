create or replace function f1() returns setof record language plpgsql
as $$
begin
return next (1, 'un'::text);
return next (2, 'deux'::text);
return;
end
$$;


select * from f1() tmp(c1 integer, c2 text);