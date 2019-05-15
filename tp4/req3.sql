DROP  FUNCTION   IF EXISTS  tp4_req3() CASCADE;

CREATE FUNCTION tp4_req3() returns TRIGGER  AS $$
DECLARE
BEGIN
	UPDATE t_theme SET nb_image = nb_image + 1 WHERE num_theme = NEW.num_theme;
	return NEW;
END
$$ language plpgsql;

CREATE TRIGGER test_exo3 after INSERT ON t_correspondre
     FOR EACH ROW
     EXECUTE PROCEDURE tp4_req3();

INSERT INTO t_correspondre(num_theme,num_image) VALUES (1,19);
