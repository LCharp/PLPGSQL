DROP FUNCTION obtenir_tous_les_trucs();

CREATE  FUNCTION obtenir_tous_les_trucs() RETURNS SETOF record AS
$BODY$
DECLARE
    r truc%rowtype;
BEGIN
    FOR r IN
        SELECT id_truc,sousid_truc FROM truc WHERE id_truc > 0
    LOOP
        -- quelques traitements
        RETURN NEXT (r.id_truc,r.sousid_truc); -- renvoie la ligne courante du SELECT
    END LOOP;
    RETURN;
END
$BODY$
LANGUAGE plpgsql;

SELECT * from obtenir_tous_les_trucs() tmp(c1 integer, c2 integer);