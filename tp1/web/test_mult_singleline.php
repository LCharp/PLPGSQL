<?php

function connect()
	{
		$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_plpgsql');
		return($idc);
	}

$idc=connect();

$sql='select mafonctionc as c from mafonctionc(6)';
 $res1 = pg_exec($idc,$sql);
$ligne=pg_fetch_assoc($res1);
	
	print ($ligne['c']);


 
 
 
 ?>