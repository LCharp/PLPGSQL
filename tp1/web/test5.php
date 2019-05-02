<?php

function connect()
	{
		$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_plpgsql');
		return($idc);
	}

$idc=connect();

$sql='select * from mafonction(5,4)';
 $res1 = pg_exec($idc,$sql);
 while($ligne=pg_fetch_assoc($res1))
 {
 	
	
	print ($ligne['c3'].' '.$ligne['c4'].'<br />');

 }
 
 
 
 ?>