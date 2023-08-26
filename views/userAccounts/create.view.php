<?php require base_path('views/partials/header.view.php') ?>

<form action="/register" method="POST">
	<div>

		<label for="username">username</label>
		<input type="text" name="username" id="username"
			   value="<?php if(!empty($_SESSION['old']['username'])): ?><?= $_SESSION['old']['username']?><?php endif; ?>">
		<?php if(!empty($_SESSION['errors']['username'])):?>
			<p> <?= $_SESSION['errors']['username'] ?> </p>
		<?php endif; ?>
	</div>
	<div>
		<label for="email">email</label>
		<input type="text" name="email" id="email"
			   value="<?php if(!empty($_SESSION['old']['email'])): ?><?=
				   $_SESSION['old']['email']?><?php endif; ?>">
		<?php if(!empty($_SESSION['errors']['email'])):?>
			<p> <?= $_SESSION['errors']['email'] ?> </p>
		<?php endif; ?>
	</div>
	<div>
		<label for="password">password</label>
		<input type="text" name="password" id="password">
		<?php if(!empty($_SESSION['errors']['password'])):?>
			<p> <?= $_SESSION['errors']['password'] ?> </p>
		<?php endif; ?>
	</div>
	<input type="submit" value="inscrivez vous">
</form>

</body>
</html>
