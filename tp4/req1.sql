DROP  FUNCTION   IF EXISTS  tp4_req1() CASCADE;

CREATE FUNCTION tp4_req1() RETURNS TRIGGER  AS $$
DECLARE
	curs refcursor;
	l record;
	t varchar;
BEGIN
	t:=lower(NEW.nom_theme);
	open curs for SELECT num_theme FROM t_theme WHERE lower(nom_theme)=t;
	FETCH curs INTO l;
	IF found THEN
		raise exception 'Thème existant';
		RETURN null;
	ELSE
		NEW.nom_theme:=t;
		RETURN NEW;
	END IF;
END
$$ language plpgsql;

CREATE TRIGGER test_exo1 BEFORE INSERT ON t_theme
     FOR EACH ROW
     EXECUTE PROCEDURE tp4_req1();

INSERT INTO t_theme (nom_theme) VALUES ('E') RETURNING nom_theme;
