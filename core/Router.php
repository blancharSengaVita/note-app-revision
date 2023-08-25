<?php

namespace Core;

class Router
{
	public array $routes = [];

	public function get($uri, $controller)
	{
		$this->add($uri, 'GET', $controller);
	}

	public function post($uri, $controller)
	{
		$this->add($uri, 'POST', $controller);
	}

	public function patch($uri, $controller)
	{
		$this->add($uri, 'PATCH', $controller);
	}

	public function add($uri, string $method, $controller)
	{
		$this->routes[] = compact('uri', 'method', 'controller');
	}

	public function delete($uri, $controller)
	{
		$this->add($uri, 'DELETE', $controller);
	}

	public function routeToController(string $uri, string $method)
	{
		$route = array_values(array_filter($this->routes, fn($r) => $r['uri'] === $uri && $r['method'] === strtoupper($method)));

		if (empty($route)){
			Response::abort(Response::BAD_REQUEST);
		}

		$controller = new $route[0]['controller'][0]();
		$controllerMethod = $route[0]['controller'][1];
		call_user_func([$controller, $controllerMethod]);
	}
}


//la variable $controller sera un nouvel objet qui correspond à la class du controller qu'il faut
//pour la route en question

//et la variable $controllerMethod va juste appelé la bonne fonction de cette objet pour afficher la vue


