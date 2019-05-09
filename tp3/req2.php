<?php

function connect()
	{
		$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
		return($idc);
	}

$idc=connect();

$sql='select tp3_req2 as ligne from tp3_req2()';
$res1 = pg_exec($idc,$sql);
$ligne=pg_fetch_assoc($res1);

print ($ligne['ligne']);


 ?>
