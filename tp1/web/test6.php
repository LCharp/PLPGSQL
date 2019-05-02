<?php

function connect()
	{
		$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_plpgsql');
		return($idc);
	}

$idc=connect();

$sql='select * from mafonction()';
 $res1 = pg_exec($idc,$sql);
 while($ligne=pg_fetch_assoc($res1))
 {
 	
	
	print ($ligne['v'].'<br />');

 }
 
 
 
 ?>