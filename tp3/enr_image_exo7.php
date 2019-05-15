<?php
	$idc=pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');

	$fichier=$_POST['zs_fichier'];
	$internaute=$_POST['zl_internaute'];


	$lst_theme='';
	foreach ($_POST as $cle=>$valeur)
	{
		$t=explode('_',$cle);
		if($t[0]=='cc')
		{
			$num_theme=$t[1];
			$lst_theme.='_'.$num_theme;

		}
	}

   $sql='select * from tp3_req7(\''.$fichier.'\','.$internaute.',\''.$lst_theme.'\') as v';
    $res1 = pg_exec($idc,$sql);
	while($ligne=pg_fetch_assoc($res1))
 {


	print ($ligne['v'].'<br />');

 }
?>
