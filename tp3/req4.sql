drop function if exists tp3_req4(varchar, varchar, varchar);

create function tp3_req4(in nom varchar, in prenom varchar, in login varchar) returns integer as $$
  declare
    nouv_num integer;
  begin
    insert into pgplsql_t_internaute(nom_internaute, prenom_internaute, login)
      values(nom, prenom, login) returning num_internaute into nouv_num;
    return nouv_num;
  end
$$ language plpgsql;

select * from tp3_req4('charpentier', 'lucas', 'lcharp');
