<?php
	if (session_id()=='')
		session_start();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>templates</title>
	<meta name="author" content="wopi" />
	<!-- Date: 2014-10-13 -->
</head>
<body>
	<a href="menu.php">Retour au menu</a>
	<h1>Contenu de votre panier</h1>
<table border="3">
	<tr align="center"><td>Référence</td><td>Désignation</td><td>Prix</td><td>Quantité</td><td>HT</td><td>TTC</td><td>Disponibilité</td></tr>
<?php

	include('./inclusion/connect.inc');
	$idc=connect();

	$numpanier = 1;
	$numclient = 1;


	$sql='select  ref_produit, designation,stock, prix, delai_stock, delai_hors_stock,qte
	      from t_produit, t_panier, t_ligne_panier
	      where t_produit.num_produit=t_ligne_panier.num_produit
	      and t_panier.num_panier=t_ligne_panier.num_panier
	      and t_panier.num_panier='.$numpanier.'
	      order by prix, designation';
    $res = pg_exec($idc,$sql);
	$tht=0;
	while($lg=pg_fetch_assoc($res)){
		$dispo = 'il reste '.$lg['stock'].' exemplaire(s)';
		$delai = $lg['delai_stock'];
		if($lg['stock']==0){
			$dispo = 'réapprovisionnement en cours';
			$delai = $lg['delai_hors_stock'];
		}
			$ht=$lg['prix']*$lg['qte'];
			$tht+=$ht;
			$ttc=$ht*1.20;
			print('<tr><td>'.$lg['ref_produit'].'</td><td>'.$lg['designation'].'</td><td align="right">'.$lg['prix'].' €</td>
			<td align="right">'.$lg['qte'].'</td>
			<td align="right">'.$ht.' €</td>
			<td align="right">'.$ttc.' €</td>
			<td>'.$dispo.'</td></tr>');
	}
	print('<tr><td colspan="5">Total HT</td><td align="right">'.$tht.' €</td><td></td></tr>');
	print('<tr><td colspan="5">TVA</td><td align="right">'.($tht * 0.20).' €</td><td></td></tr>');
	print('<tr><td colspan="5">Total TTC</td><td align="right">'.($tht * 1.20).' €</td><td></td></tr>');
?>

</table>
<a href="menu.html">Menu</a><br />
</body>
</html>
