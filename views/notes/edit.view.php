<?php require base_path('views/partials/header.view.php') ?>


<h1> Modifier la note </h1>

<form action="/note" method="POST">
	<label for="description">label pour description</label>

	<?php if (!empty($_SESSION['errors']['description'])): ?>
		<p class="errors"><?= $_SESSION['errors']['description'] ?></p>
	<?php endif ?>

	<textarea name="description" id="description" cols="30" rows="10"><?= $notes->description ?></textarea>

	<button type="submit"> Envoyer la note</button>
</form>

</body>
</html>
