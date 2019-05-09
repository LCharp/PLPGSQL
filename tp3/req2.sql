drop function if exists tp3_req2();

create function tp3_req2() returns varchar as $$
  declare
    curseur cursor for select nom_fichier, to_char(date_mel,'dd/mm/yyyy') as date_mail, nom_internaute, prenom_internaute
     from pgplsql_t_image
     inner join pgplsql_t_internaute on pgplsql_t_image.num_internaute=pgplsql_t_internaute.num_internaute;
    ligne record;
    tableau varchar;
  begin
    tableau := '<table border ="3">';
    tableau := tableau||'<tr><td>Fichier</td><td>Date</td><td>Internaute</td></tr>';

    for ligne in curseur loop
      tableau := tableau||'<tr><td>'||ligne.nom_fichier||'</td><td>'||ligne.date_mail||'</td><td>'||ligne.nom_internaute||' '||ligne.prenom_internaute||'</td></tr>';
    end loop;
    
    tableau := tableau||'</tableau>';
    return tableau;
  end
$$ language plpgsql;

select * from tp3_req2();
