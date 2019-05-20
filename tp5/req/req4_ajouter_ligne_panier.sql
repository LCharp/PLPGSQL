DROP FUNCTION IF EXISTS ajouter_ligne_panier (integer, integer, integer);

CREATE FUNCTION ajouter_ligne_panier (in num_prod integer, in quantite integer, in num_pan integer) RETURNS integer AS $$
DECLARE
    curseur refcursor;
    ligne record;
    qte integer;
BEGIN
    OPEN curseur FOR SELECT * FROM t_ligne_panier WHERE num_panier = num_pan AND num_produit = num_prod;
    FETCH curseur into ligne;
    IF FOUND THEN
        qte := ligne.quantite + quantite;
        UPDATE t_ligne_panier SET quantite = qte WHERE num_panier = num_pan AND num_produit = num_prod;
    ELSE
        qte := quantite;
        INSERT INTO t_ligne_panier VALUES (num_pan, num_prod, qte);
    END IF;
    RETURN 0;
END
$$ language plpgsql;
