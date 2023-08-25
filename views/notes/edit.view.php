<?php require base_path('views/partials/header.view.php') ?>


<h1> Modifier la note </h1>

<form action="/note" method="POST">
	<input type="hidden" name="_method" value="patch">
	<label for="description">label pour description</label>

	<?php if (!empty($_SESSION['errors']['description'])): ?>
		<p class="errors"><?= $_SESSION['errors']['description'] ?></p>
	<?php endif ?>

	<textarea name="description" id="description" cols="30" rows="10"><?= $notes->description ?></textarea>

	<input type="hidden" name="id" value="<?=$notes->id?>">
	<input type="submit" value="Envoyer la note">
</form>

</body>
</html>
