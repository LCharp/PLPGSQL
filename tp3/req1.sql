drop function if exists tp3_req1(int);

create function tp3_req1 (in num integer) returns integer as $$
  declare
    curseur refcursor;
    ligne record;
  begin
    open curseur for select count(num_internaute) as nombre from pgplsql_t_image where num_internaute=num;
    fetch curseur into ligne;
    return ligne.nombre;
  end
$$ language plpgsql;

select * from tp3_req1(1);
