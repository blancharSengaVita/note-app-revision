<?php

namespace Core;

class Router
{
	public array $routes = [];

	public function get($uri, $controller)
	{
		$this->add($uri, 'GET', $controller);
	}

	public function add($uri, string $string, $controller)
	{
		$this->routes[] = compact('uri', 'string', 'controller');
	}

}





