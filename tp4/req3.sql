DROP  FUNCTION   IF EXISTS  tp4_req3() CASCADE;
CREATE FUNCTION tp4_req3() returns TRIGGER  AS $$
declare
BEGIN
	update t_theme set nb_image=nb_image+1
	where num_theme=NEW.num_theme;
	return NEW;
END
$$ language plpgsql;

create trigger test_exo3 after INSERT ON t_correspondre
     FOR EACH ROW
     EXECUTE PROCEDURE tp4_req3();

insert into t_correspondre(num_theme,num_image) values(1,19)
