drop function if exists tp3_req1b(int);

create function tp3_req1b (in num integer) returns integer as $$
  declare
    curseur cursor for select num_internaute from pgplsql_t_image;
    ligne record;
    compteur integer;
  begin
    compteur := 0;
    for ligne in curseur loop
      if ligne.num_internaute = num then
        compteur := compteur + 1;
      end if;
    end loop;
    return compteur;
  end
$$ language plpgsql;

select * from tp3_req1b(1);
