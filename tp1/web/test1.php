<?php

function connect()
	{
		$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_sql');
		return($idc);
	}

$idc=connect();
$sql='select * from test2(20)';
$rs=pg_exec($idc,$sql);
$ligne=pg_fetch_assoc($rs);
/*
foreach($ligne as $cle=>$valeur)
{
	print ($cle.' '.$valeur. 'fin<br />');
}


 */
print($ligne['test2']);
