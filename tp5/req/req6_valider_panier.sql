DROP FUNCTION  IF EXISTS valider_panier(integer);

CREATE FUNCTION valider_panier (in nump integer) returns varchar AS $$
declare
	curs refcursor;
	l record;
	numcom integer;
	numcli integer;
	res varchar;
	dispo varchar;
	delai varchar;
	ht real;
	tht real;
	ttc real;

BEGIN
	open curs for select num_client from t_panier where num_panier=nump;
	fetch curs into l;
	numcli := l.num_client;
	close curs;

	insert into t_commande (num_client, date_commande) values(numcli, now()) returning num_commande into numcom;

	open curs for select  t_produit.num_produit, qte, ref_produit, designation,stock, prix, delai_stock, delai_hors_stock,qte
	      from t_produit, t_panier, t_ligne_panier
	      where t_produit.num_produit=t_ligne_panier.num_produit
	      and t_panier.num_panier=t_ligne_panier.num_panier
	      and t_panier.num_panier=nump;

	fetch curs into l;
	tht:=0;
	res:='<h1>Numéro de commande : '||numcom||' </h1>';
	res:=res||'<h2>En date du : '||to_char(now(),'dd/mm/yyyy')||' </h1>';
	res := res|| '<table border="3">';
	res := res || '<tr align="center"><td>Référence</td><td>Désignation</td><td>Prix</td><td>Quantité</td><td>HT</td><td>TTC</td><td>Disponibilité</td></tr>';
	while found loop
		dispo := 'il reste '||l.stock||' exemplaire(s)';
		delai = l.delai_stock;
		if l.stock=0 then
			dispo := 'réapprovisionnement en cours';
			delai := l.delai_hors_stock;
		end if;
		ht:=l.prix*l.qte;
		tht:=tht+ht;
		ttc:=ht*1.20;
		res:=res||'<tr><td>'||l.ref_produit||'</td><td>'||l.designation||'</td><td align="right">'||l.prix||
			' €</td><td align="right">'||l.qte||'</td><td align="right">'||ht||' €</td><td align="right">'||ttc||
			' €</td><td>'||dispo||'</td></tr>';
		insert into t_ligne_commande(num_commande,num_produit,qte) values (numcom,l.num_produit, l.qte);
		update t_produit set stock = stock - l.qte where num_produit = l.num_produit;
		fetch curs into l;
	end loop;
	res:=res||'<tr><td colspan="5">Total HT</td><td align="right">'||tht||' €</td><td></td></tr>';
	res:=res||'<tr><td colspan="5">TVA</td><td align="right">'||(tht * 0.20)||' €</td><td></td></tr>';
	res:=res||'<tr><td colspan="5">Total TTC</td><td align="right">'||(tht * 1.20)||' €</td><td></td></tr>';
	delete from t_ligne_panier where num_panier=nump;
	delete from t_panier where num_panier=nump;
	res := res || '</table>';
	return res;
END
$$ language plpgsql;
