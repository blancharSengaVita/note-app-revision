<?php views_path('partials/header.view.php'); ?>
<main>
	<h1>Voici toutes les notes</h1>
	<ul>
		<?php foreach ($notes as $note): ?>
			<li>
				<a href="http://note-app-revision.localhost/note?id=<?= $note->id ?>"><?= ($note->description) ?></a>
			</li>
		<?php endforeach; ?>
		<a style="font-size: 1.5rem;" href="/note/create"> Créer une note </a>
	</ul>
</main>
</body>
</html>