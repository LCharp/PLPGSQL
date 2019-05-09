drop function if exists tp3_req5(varchar, varchar, varchar);

create function tp3_req5(in nom varchar, in prenom varchar, in nouv_login varchar) returns integer as $$
  declare
    curseur refcursor;
    ligne record;
    nouv_num integer;
  begin
    open curseur for select num_internaute from pgplsql_t_internaute where login = nouv_login;
    fetch curseur into ligne;
    if found then
      nouv_num := -1;
    else
      insert into pgplsql_t_internaute(nom_internaute, prenom_internaute, login)
        values(nom, prenom, nouv_login) returning num_internaute into nouv_num;
    end if;
    return nouv_num;
  end
$$ language plpgsql;

select * from tp3_req5('charpentier', 'lucas', 'lcharp36');
