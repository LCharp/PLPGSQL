<?php

function connect()
	{
		$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
		return($idc);
	}

$idc=connect();

$sql='select tp2_req9 as chiffre from tp2_req9(6,\'30%\')';
$rs = pg_exec($idc,$sql);
$ligne=pg_fetch_assoc($rs);

print ($ligne['chiffre']);


 ?>
