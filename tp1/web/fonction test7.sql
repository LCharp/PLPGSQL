DROP FUNCTION obtenir_tous_les_trucs();

CREATE  FUNCTION obtenir_tous_les_trucs() RETURNS SETOF record AS
$BODY$
DECLARE
    r truc%rowtype;
BEGIN
    FOR r IN
        SELECT id_truc,sousid_truc FROM truc 
    LOOP
        -- quelques traitements
        if  r.id_truc > 0 then
		RETURN NEXT (r.id_truc+10,r.sousid_truc); -- renvoie la ligne courante du SELECT
	end if;
    END LOOP;
    RETURN;
END
$BODY$
LANGUAGE plpgsql;

SELECT * from obtenir_tous_les_trucs() tmp(c1 integer, c2 integer);