DROP  FUNCTION   IF EXISTS  tp4_req1() CASCADE;
CREATE FUNCTION tp4_req1() returns TRIGGER  AS $$
declare
	curs refcursor;
	l record;
	t varchar;
BEGIN
	t:=lower(NEW.nom_theme);
	open curs for select num_theme from t_theme
	    where lower(nom_theme)=t;
	fetch curs into l;
	if found then
		raise exception 'Thème existant';
		return null;
	else
		NEW.nom_theme:=t;
		return NEW;
	end if;
END
$$ language plpgsql;

create trigger test_exo1 BEFORE INSERT ON t_theme
     FOR EACH ROW
     EXECUTE PROCEDURE tp4_req1();

insert into t_theme(nom_theme) values('C') returning nom_theme;
