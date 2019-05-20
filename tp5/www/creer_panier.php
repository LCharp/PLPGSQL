<?php
	if (session_id()=='')
		session_start();
	include('./inclusion/connect.inc');
	$idc=connect();
	$numcli = 1;
	$sql='select * from creer_panier('.$numcli.') as num';
    $res = pg_exec($idc,$sql);
	$ligne=pg_fetch_assoc($res);

	$_SESSION['num_panier']=$ligne['num'];

	print($_SESSION['num_panier']);


	header('Location: menu.php');
  exit();
?>
