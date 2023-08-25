<?php views_path('partials/header.view.php'); ?>
<main>
	<h1>Voici toutes les notes</h1>
	<ul>
		<?php foreach ($notes as $note): ?>
			<li>
				<a href="http://note-app-revision.localhost/notes/note?id=<?= $note->id ?>"><?= ($note->description) ?></a>
			</li>
		<?php endforeach; ?>

		<a style="font-size: 1.5rem;" href="/notes/create"> créer une note </a>
	</ul>
</main>
</body>
</html>