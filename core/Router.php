<?php

namespace Core;


use Core\Middleware\Middleware;
use Exception;

class Router
{
	public array $routes = [];

	//on va dire à toutes nos methodes de retourner le router afin de pouvoir chainer mes méthodes
	public function get($uri, $controller)
	{
		$this->add($uri, 'GET', $controller);
		return $this;
	}

	public function post($uri, $controller)
	{
		$this->add($uri, 'POST', $controller);
		return $this;
	}

	public function patch($uri, $controller)
	{
		$this->add($uri, 'PATCH', $controller);
		return $this;
	}

	public function delete($uri, $controller)
	{
		$this->add($uri, 'DELETE', $controller);
		return $this;
	}

	public function add($uri, string $method, $controller)
	{
		//on va creéer un tableau qui va contenir les clés des middleware
		$middleware = [];
		$this->routes[] = compact('uri', 'method', 'controller', 'middleware');
		return $this;
	}

	//on va créer une fonction only qui va ajouté pour chaque route la valeur de leur
	//middleware (c'est dans l'argument)
	public function only($value){
		$this->routes[array_key_last($this->routes)]['middleware'][] = $value;
		return $this;
	}

	//la methode ajoute le nom du middleware dans le tableau à tous ceux qui ont la méthode
	public function csrf()
	{
		$this->routes[array_key_last($this->routes)]['middleware'][] = 'csrf';
		return $this;
	}


	public function routeToController(string $uri, string $method)
	{
//		dd($this->routes);

		$route = array_values(array_filter($this->routes, fn($r) => $r['uri'] === $uri && $r['method'] === strtoupper($method)));


		if (!empty($route[0]['middleware'])){
			try{
				//on fait une boucle qui demande de résoudre tous les middleware
				foreach ($route[0]['middleware'] as $middleware){
					Middleware::resolve($middleware);
				}

			}catch (Exception $e){
				throw new Exception($e);
			}
		}
//		dd($route);

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


