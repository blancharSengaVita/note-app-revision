<?php views_path('partials/header.php'); ?>
<main>
	<h1>Voici toutes les notes</h1>
	<ul>
		<?php foreach ($notes as $note): ?>
			<li>
				<p><?= ($note->description) ?></p>
			</li>
		<?php endforeach; ?>
	</ul>
</main>
</body>
</html>