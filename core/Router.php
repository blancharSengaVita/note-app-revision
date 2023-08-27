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


	public function routeToController(string $uri, string $method)
	{
		$route = array_values(array_filter($this->routes, fn($r) => $r['uri'] === $uri && $r['method'] === strtoupper($method)));

		//si il n'y a pas de middleware
		//on va demander à la classe Middleware
		//de resoudre ce probleme
		//et si elle retourne une expection
		//on l'attrape
		//et on l'affiche
		if (!empty($route[0]['middleware'])){
			try{
				Middleware::resolve($route[0]['middleware'][0]);
			}catch (Exception $e){
				throw new Exception($e);
			}
		}

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


