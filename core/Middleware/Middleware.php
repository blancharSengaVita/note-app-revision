<?php

namespace Core\Middleware;

use Exception;

class Middleware
{
	//on a un array associatif qui contient
	//comme clé les valeurs que only peut recevoir
	//et on les associe a une classe

	//les classes devront justes rediriger les vers une page
	const Map = [
		'guest' => Guest::class,
		'authenticated' => Authenticated::class,
	];

	//la fonction regarder si le nom du middleware qu'on
	//reçoit existe
	//si oui, on appelle la fonction handle qui va rediriger vers
	//une page
	public static function resolve($name)
	{
		if (!array_key_exists($name, self::Map)) {
			throw new Exception('this middleware doesnt exist');
		}
		$middleware = self::Map[$name];
		 (new $middleware)->handle();

	}
}