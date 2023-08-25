<?php require base_path('views/partials/header.view.php') ?>

<form action="/register" method="POST">
	<div>
		<label for="name">name</label>
		<input type="text" name="name" id="name">
	</div>
	<div>
		<label for="email">email</label>
		<input type="text" name="email" id="email">
	</div>
	<div>
		<label for="password">password</label>
		<input type="text" name="password" id="password">
	</div>
	<input type="submit" value="inscrivez vous">
</form>

</body>
</html>
