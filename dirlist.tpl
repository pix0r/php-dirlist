<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
	<title><?php echo htmlentities($config['title']) ?></title>
	<style type="text/css">
	a:hover {
	  text-decoration: none;
	  color:white; background-color:black;
	  background: #000000;
	  color: #FFFFFF;
	  cursor: pointer;
	}

	  body,p,td {
	      text-decoration: none;
	      font-family: Verdana, Arial, Helvetica, sans-serif; 
	      font-size: 11px;
	      color: #7EB688;
	      background-color: #242424;
	  }
	a:link {
		color: #00CCFF;
	        text-decoration: none;
	}
	</style>
<body vlink="#999999" alink="#00CCFF">
	
	<h1><?php echo $config['title'] ?></h1>

<?php if ($file): ?>
	<img src="<?php echo $_SERVER['PHP_SELF'] ?>?a=view&f=<?php echo urlencode($file) ?>" alt="<?php echo htmlentities($file) ?>" />
	<br /><br />
<?php endif; ?>

<?php if (count($files)): ?>
<ul>
	<?php foreach ($files as $file): ?>
		<li><a href="<?php echo $_SERVER['PHP_SELF'] ?>?f=<?php echo urlencode($file) ?>"><?php echo htmlentities($file) ?></a></li>
	<?php endforeach; ?>
</ul>
<?php else: ?>
	<p>No files found</p>
<?php endif; ?>

</html>
</body>
