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
<a href="connecter.php">Se connecter</a><br />
<a href="creer_panier.php">Créer panier</a><br />
<a href="voir_produits.php">voir articles</a><br />
<a href="voir_panier.php">voir panier</a><br />
<a href="valider_panier.php">valider panier</a><br />
</body>
</html>
