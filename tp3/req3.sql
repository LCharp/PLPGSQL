drop function if exists tp3_req3();

create function tp3_req3() returns varchar as $$
  declare
    curseur cursor for select nom_fichier, to_char(date_mel,'dd/mm/yyyy') as date_mail from pgplsql_t_image;
    ligne record;
    tableau varchar;
  begin
    tableau := '<table border ="3">';
    tableau := tableau||'<tr><td>Fichier</td><td>Date</td><td>Image</td></tr>';

    for ligne in curseur loop
      tableau := tableau||'<tr><td>'||ligne.nom_fichier||'</td><td>'||ligne.date_mail||'</td><td><img src="'||ligne.nom_fichier||'"/></td></tr>';
    end loop;

    tableau := tableau||'</tableau>';
    return tableau;
  end
$$ language plpgsql;

select * from tp3_req3();
