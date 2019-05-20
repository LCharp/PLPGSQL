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
<table border="3">
	<tr align="center"><td>Référence</td><td>Désignation</td><td>Prix</td><td>Disponibilité</td></tr>
<?php

	include('./inclusion/connect.inc');
	$idc=connect();

	$sql='select num_produit, ref_produit, designation,stock, prix
	      from t_produit
	      order by prix, designation';
    $res = pg_exec($idc,$sql);
	while($lg=pg_fetch_assoc($res)){
		$dispo = 'réapprovisionnement en cours';
		if($lg['stock']>0){
			$dispo = 'il reste '.$lg['stock'].' exemplaires';
		}
		print('<tr><td><a href="./voir_produit.php?id='.$lg['num_produit'].'">'.$lg['ref_produit'].
			'</a></td><td>'.$lg['designation'].'</td><td align="right">'.$lg['prix'].' €</td><td>'.$dispo.'</td></tr>');
	}


?>
</table>
</body>
</html>
