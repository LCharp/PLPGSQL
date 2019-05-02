

CREATE  FUNCTION test_retour_soustable() RETURNS SETOF record AS
$BODY$
DECLARE
    r t1%rowtype;
BEGIN
    FOR r IN
        SELECT c1,c2,c3 FROM t1 
    LOOP
        -- quelques traitements

		RETURN NEXT (r.c1,r.c2::text); -- renvoie la ligne courante du SELECT

    END LOOP;
    RETURN;
END
$BODY$
LANGUAGE plpgsql;

SELECT * from test_retour_soustable() tmp(c1 integer, c2 text);