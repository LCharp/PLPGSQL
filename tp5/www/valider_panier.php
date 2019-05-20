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
<?php

	include('./inclusion/connect.inc');
	$idc=connect();
	$numpanier = 1;
	$sql='select * from valider_panier('.$numpanier.') as tbl';
    $res = pg_exec($idc,$sql);
	$ligne=pg_fetch_assoc($res);


	print($ligne['tbl']);
?>
</body>
</html>
