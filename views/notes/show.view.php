<?php views_path('partials/header.view.php'); ?>
<h1> Voici votre note </h1>
<p> <?= $notes->description ?></p>
<a href="note/edit?id=<?= $notes->id ?> "> Modifier la note </a>
</body>
</html>