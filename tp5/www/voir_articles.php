<?php
	if (session_id()=='')
		session_start();
	include('./inclusion/connect.inc');
	$idc=connect();
	
	$sql='select * from verif_login(\''.$_POST['zs_login'].'\',\''.$_POST['zs_mdp'].'\') as num';
    $res1 = pg_exec($idc,$sql);
	$ligne=pg_fetch_assoc($res1);
	if ($ligne['num']==-1){
		print('pas ok');
	}
	else {
		$_SESSION['num_cli']=$ligne['num'];
	}

?>