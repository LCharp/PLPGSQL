<?php

$idc = pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
$sql='select * from req8(5)';
$rs=pg_exec($idc,$sql);
$ligne=pg_fetch_assoc($rs);

while($ligne=pg_fetch_assoc($rs))
{
 print ($ligne['req8'].'<br />');
}
