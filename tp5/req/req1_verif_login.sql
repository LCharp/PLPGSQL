DROP FUNCTION IF EXISTS verif_login(varchar, varchar);

CREATE FUNCTION verif_login (in inlogin varchar, in password varchar) RETURNS integer AS $$
DECLARE
    curseur refcursor;
    longueur record;
    resultat integer;
BEGIN
    OPEN curseur FOR SELECT num_client FROM t_client WHERE login = login AND mdp = password;
    FETCH curseur into longueur;
    resultat = -1;
    IF FOUND THEN
        resultat = longueur.num_client;
    END IF;
    RETURN resultat;
END
$$ language plpgsql;

SELECT * FROM verif_login('a','a');
