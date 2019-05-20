<?php
function connect()
{
	$idc=pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
	return ($idc);
}
?>
