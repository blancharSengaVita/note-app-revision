<!doctype html>
<html lang="fr">
<style>
	body {
		font-family: Mukta;
	}

	p {
		margin: 0;
	}

	a {
		color: black;
	}

	a:hover {
		font-weight: 900;
	}

	a:visited {
		color: black;
	}

	.errors {
		color: red;
		font-size: 1.25rem;
	}

	ul {
		margin: 0;
	}

	h2 {
		margin-top: 0;
	}

	li {
		list-style-type: none
	}

	body {
		background-color: antiquewhite;
	}

	header {
		background-color: skyblue;
		width: 100%;
	}
</style>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title><?= 'document' ?></title>
</head>
<body>
<header>
	<nav>
		<h2 class="sro">

		</h2>
		<ul style="display: flex">
			<li style="margin-right:2rem"><a href="/">accueil</a></li>
			<?php if (isset($_SESSION['user'])): ?>
				<li><a style="margin-right:2rem" href="/notes">Voir les notes</a></li>

				<li style="margin-right:2rem"><p> <?= $_SESSION['user']->name; ?></p></li>
				<li>
					<form action="/logout" method="post">
						<input type="submit" value="se deconnecter">
						<input type="hidden" name="_method" value="delete">
					</form>
				</li>
			<?php else: ?>
				<li><a style="margin-right:2rem" href="/register">S'incrire</a></li>
				<li><a style="margin-right:2rem" href="/login">Se connecter</a></li>
			<?php endif; ?>

		</ul>
	</nav>
</header>