<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>templates</title>
	<meta name="author" content="wopi" />
	<!-- Date: 2014-10-13 -->
</head>
<body>
<form name="frm" method="post" action="./enr_image_exo7.php">
Fichier <input type="text" name="zs_fichier" /><br />
Internaute<select name="zl_internaute">

	<?php
	$idc=pg_connect('host=localhost user=postgres password=postgres dbname=bd_charpentier');
	$sql='select num_internaute, login
          from t_internaute';
	$rs=pg_exec($idc,$sql);

	while($ligne=pg_fetch_assoc($rs))
	{
		print('<option value="'.$ligne['num_internaute'].'">'.
			      $ligne['login'].'</option>');
	}
?>
	</select><br />
	Choisr les thèmes :<br />
	<?php
		$sql='select nom_theme, num_theme
				from t_theme
				order by nom_theme';
		$rs=pg_exec($idc,$sql);

		while($ligne=pg_fetch_assoc($rs))
		{
			print('<input type="checkbox" value="'.$ligne['num_theme'].'"
			     name="cc_'.$ligne['num_theme'].'" />'.$ligne['nom_theme'].'<br />');
		}
	?>
	<input type="submit" value="Go!" />
</form>

</body>
</html>
