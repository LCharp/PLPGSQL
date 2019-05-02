<?php

$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
$sql='select * from date_fr()';
$rs=pg_exec($idc,$sql);
$ligne=pg_fetch_assoc($rs);
/*
foreach($ligne as $cle=>$valeur)
{
	print ($cle.' '.$valeur. 'fin<br />');
}


 */
print($ligne['date_fr']);
