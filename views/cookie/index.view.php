<!doctype html>
<html lang="fr">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
</head>
<body>
<P>
	pour comencer un cookie
</P>
<?= $_COOKIE['lang'] ?>
<?php if (!empty($_COOKIE['utilisateur'])): ?>
	<p>  Bonjour : <?= htmlspecialchars($_COOKIE['utilisateur']) ?>  </p>
<?php else: ?>
	<form action="/cookie" method="get">
		<label for="utilisateur">utilisateur</label>
		<input type="text" name="utilisateur" id="utilisateur">

		<input type="submit" value="soumets-moi">
	</form>
<?php endif; ?>
<?php //dd(serialize($user2));  ?><!-- -->
<?php //dd(unserialize(serialize($user2)));  ?>

<?php $blanblan = unserialize($blanchar) ?>
<?php foreach ($blanblan as $blan): ?>
<p><?= $blan ?></p>
<?php endforeach; ?>

<form action="/deconnexion" method="post">
	<input type="hidden" name="_method" value="delete">
	<input type="submit" value="déconnecte moi">
</form>

<form action="/cookie" method="get">
	<?php if(isset($yo)): ?>
		<?php foreach ($yo as $y): ?>
	<p><?= $y ?></p>
	<?php endforeach; ?>
	<?php endif; ?>


	<input type="hidden" name="yo[]" value="1">
	<input type="hidden" name="yo[]" value="2">
	<input type="hidden" name="yo[]" value="3">
	<input type="submit" value="stocker dans un tableau">
</form>

</body>
</html>