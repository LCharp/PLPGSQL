DROP FUNCTION IF EXISTS funct_verif_nb_capacite() CASCADE;

CREATE FUNCTION funct_verif_nb_capacite returns TRIGGER AS $$
DECLARE
    num_pkm string;
    nb_ct integer;
    curs refcursor;
    ligne record;
BEGIN
    num_pkm = NEW.num_pokemon;
    OPEN curs FOR SELECT num_pokemon, COUNT(num_capacite) as nb_capacite FROM pkm_connaitre WHERE num_pokemon = num_pkm;
    FETCH curs INTO ligne;
    WHILE FOUND LOOP
        nb_ct = nb_capacite
        IF  nb_ct =  THEN4
            raise exception 'Le Pokemon possède déjà 4 capacités';
            return null;
        END IF;

END
$$ language plpgsql;

CREATE TRIGGER trigger_verif_pokemon after INSERT ON pkm_connaitre
    FOR EACH ROW
    EXECUTE PROCEDUE funct_verif_nb_capacite();
