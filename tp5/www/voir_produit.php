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
<h1>Fiche produit</h1>
<form name="frm" action="mise_au_panier.php" method="post">
<?php

	include('./inclusion/connect.inc');
	$idc=connect();
	$nump=$_GET['id'];
	$sql='select num_produit, ref_produit, designation,stock, prix, delai_stock, delai_hors_stock
	      from t_produit
	      where num_produit='.$nump.'
	      order by prix, designation';
    $res = pg_exec($idc,$sql);
	$lg=pg_fetch_assoc($res);
	$dispo = 'il reste '.$lg['stock'].' exemplaire(s)';
	$delai = $lg['delai_stock'];
	if($lg['stock']==0){
		$dispo = 'réapprovisionnement en cours';
		$delai = $lg['delai_hors_stock'];
	}

	print('<h2>Référence : '.$lg['ref_produit'].'</h2>');
	print('<h2>Désignation : '.$lg['designation'].'</h2>');
	print('<h2>Disponibilité : '.$dispo.'</h2>');
	print('<h2>Délai de livraision : '.$delai.' jours</h2>');
	print('<h2>Quantité : <input type="text" name="zsq" />
	       <input type="submit" value="Ajouter au panier" /></h2>');
	print('<input type="hidden" name="zsid" value="'.$lg['num_produit'].'"/>');

?>

</form>

</body>
</html>
