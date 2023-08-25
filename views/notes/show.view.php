<?php views_path('partials/header.view.php'); ?>
<h1> Voici votre note </h1>
<p> <?= $notes->description ?></p>
<a href="note/edit?id=<?= $notes->id ?> "> Modifier la note </a>
<form action="/note" method="POST">
	<input type="hidden" name="_method" value="delete">
	<input type="hidden" name="id" value="<?= $notes->id ?>">
	<button type="submit"> supprimer la note </button>
</form>
</body>
</html>