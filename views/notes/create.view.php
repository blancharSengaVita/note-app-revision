<?php require base_path('views/partials/header.view.php'); ?>

<h1> Créer une note </h1>

<form action="/note" method="POST">
	<label for="description">label pour description</label>

	<?php if (!empty($_SESSION['errors']['description'])): ?>
		<p class="errors"><?= $_SESSION['errors']['description'] ?></p>
	<?php endif ?>

	<textarea name="description" id="description" cols="30" rows="10"><?php if (!empty($_SESSION['old']['description'])): ?><?= $_SESSION['old']['description'] ?><?php endif ?></textarea>

	<button type="submit"> envoyer la note</button>
</form>

</body>
</html>