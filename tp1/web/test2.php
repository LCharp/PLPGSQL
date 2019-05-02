<?php

function connect()
	{
		$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_sql');
		return($idc);
	}

$idc=connect();

$sql='select * from test3()';
 $res1 = pg_exec($idc,$sql);
 while($ligne=pg_fetch_assoc($res1))
 {
 	
	
	print ($ligne['num_eq'].' '.$ligne['nom_eq'].'<br />');

 }
 
 
 
 ?>