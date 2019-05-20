DROP FONCTION IF EXISTS creer_panier(integer);

CREATE FUNCTION creer_panier (in num_client integer) RETURNS integer AS $$
DECLARE
    num_panier integer;
BEGIN
    INSERT INTO t_panier (num_client) values(num_client) returning num_panier into num_panier;
    RETURN(num_panier);
END
$$ language plpgsql;
