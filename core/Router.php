<?php

namespace Core;

class Router
{
	protected array $routes = [];

	public function get($uri, $controller)
	{
		$this->add($uri, 'GET', $controller);
	}

	public function add($uri, string $string, $controller)
	{
		$this->routes[] = compact('uri', $string, $controller);
	}
}

//ici on a une 1er methode get qui reçoit en argument l'uri et le controller qu'on a donner dans routes.php
//Cette méthode va en appeler une autre en lui donnant en argument l'uri, le controller et la methode GET et ces information seront dans un tableau qui sera lui meme dans le le tableau routes

//Je vous rappelle que cette methode s'appelle get car elle a était declenché par une methode get, c'est une information qu'on va aussi mettre dans le tableau qui sera dans le tableau route
