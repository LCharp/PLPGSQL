<?php

function connect()
	{
		$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_plpgsql');
		return($idc);
	}

$idc=connect();

$sql='SELECT * from f1() liste(c1 integer, c2 text);';
 $res1 = pg_exec($idc,$sql);
 while($ligne=pg_fetch_assoc($res1))
 {
 	
	
	print ($ligne['c1'].' '.$ligne['c2'].'<br />');

 }
 
 
 
 ?>