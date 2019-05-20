DROP  FUNCTION   IF EXISTS  funct_creer_panier() CASCADE;

CREATE FUNCTION funct_creer_panier() returns TRIGGER  AS $$
declare
	nump integer;
	numc integer;
	nump2 integer;
	curs refcursor;
	ligne record;

BEGIN
	nump = NEW.num_panier;
	numc = NEW.num_client;
	OPEN curs FOR SELECT num_panier FROM t_panier WHERE num_client=numc AND num_panier < nump;
	FETCH curs INTO ligne;
	WHILE FOUND LOOP
		nump2=ligne.num_panier;
		DELETE FROM t_ligne_panier WHERE num_panier = nump2;
		FETCH curs INTO ligne;
	END LOOP;

	DELETE FROM t_panier WHERE num_client=numc AND num_panier < nump;
	RETURN NULL;

END
$$ language plpgsql;

CREATE TRIGGER trigger_creer_panier after INSERT ON t_panier
     FOR EACH ROW
     EXECUTE PROCEDURE funct_creer_panier();
