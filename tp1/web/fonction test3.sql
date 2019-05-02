
CREATE or replace FUNCTION test3() RETURNS table(num_eq int, nom_eq varchar(20)) AS $$

BEGIN
    
    RETURN QUERY select num_eq,nom_eq from equipe;
END;
$$ LANGUAGE plpgsql;