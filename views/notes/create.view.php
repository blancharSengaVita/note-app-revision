<?php views_path('partials/header.view.php'); ?>

<h1> Créer une note </h1>

<form action="/note" method="POST" >
	<label for="description">

	</label>
	<textarea name="description" id="description" cols="30" rows="10"></textarea>
	<button type="submit"> envoyer la note</button>
</form>

</body>
</html>