DROP  FUNCTION   IF EXISTS  funct_maj_stock_v2() CASCADE;

CREATE FUNCTION funct_maj_stock_v2() returns TRIGGER  AS $$
declare

BEGIN
	IF NEW.stock < 0 THEN
		NEW.stock=0;
	END IF;
    RETURN NEW;
END
$$ language plpgsql;

CREATE TRIGGER trigger_maj_stock BEFORE UPDATE OF stock ON t_produit
     FOR EACH ROW
     EXECUTE PROCEDURE funct_maj_stock_v2();
