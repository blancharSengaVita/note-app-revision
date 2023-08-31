<?php require base_path('views/partials/header.view.php'); ?>

<h1> Créer une note </h1>

<form action="/note" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="csrf_token" value="<?= csrf() ?>">

	<div>
		<div>
			<label for="description">label pour description</label>

			<?php if (!empty($_SESSION['errors']['description'])): ?>
				<p class="errors"><?= $_SESSION['errors']['description'] ?></p>
			<?php endif ?>
		</div>
		<div>
			<textarea name="description" id="description" cols="30" rows="10"><?php if (!empty($_SESSION['old']['description'])): ?><?= $_SESSION['old']['description'] ?><?php endif ?></textarea>
		</div>
	</div>
	
	<div style="margin-bottom: 1rem">
		<div >
			<label for="thumbnail">Thumbnail</label>
		</div>
		<div>
			<input type="file" name="thumbnail" id="thumbnail">
		</div>
	</div>
	<button type="submit"> envoyer la note</button>
</form>

</body>
</html>