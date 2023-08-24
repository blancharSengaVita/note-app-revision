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

	public function routeToController($uri, mixed $method)
	{
		$route = array_values(array_filter($this->routes, fn($r)=> $r['uri'] === $uri && $r['method'] = strtoupper($method)));

		dd($route);
	}


}

//je laisse chat gpt expliquer mais en gros on filtre les elements de $routes pour garder que LA ROUTE qui le uri et la methode demande

//chat GPT : on crée un variable route qui sera un nouveau tableau indexés et flitré en fonction de l'uri et de la methode que prend en argumant la fonction, je laisse chat gtp expliqué le reste

//*La fonction que vous avez fournie est composée de deux fonctions intégrées en PHP : array_filter et array_values. Voici comment elle fonctionne dans l'ensemble :

//array_filter($this->routes, fn ($r) => $uri === $r['uri'] && strtoupper($method) === $r['method']) :

//array_filter est une fonction intégrée qui permet de filtrer un tableau en fonction d'une condition donnée.

//$this->routes est le tableau que vous filtrez. Il semble contenir des configurations de routes.

//fn ($r) => $uri === $r['uri'] && strtoupper($method) === $r['method'] est une fonction anonyme (expression lambda) qui sert de condition de filtrage. Cette fonction prend chaque élément du tableau (chaque configuration de route) comme argument $r et renvoie true si la condition est satisfaite (l'URI et la méthode correspondent), ou false sinon.
//array_values(...) :

//array_values est une fonction qui prend un tableau associatif (ou indexé) et renvoie un nouveau tableau contenant uniquement les valeurs du tableau d'origine, avec des indices numériques (reindexage).
//En résumé, la ligne de code que vous avez fournie réalise ce qui suit :

//Elle filtre le tableau $this->routes pour ne conserver que les configurations de route qui correspondent à la fois à l'URI et à la méthode demandée.
//Elle utilise array_values pour obtenir un nouveau tableau contenant uniquement les valeurs filtrées, réindexées numériquement.

//Donc, la sortie de cette ligne de code sera un tableau contenant les configurations de route qui correspondent à l'URI et à la méthode que vous avez spécifiées. Ce tableau sera utilisé pour plus de traitement dans le reste de la fonction.
//demander à chat gpt

//Moi que vaut $r

//Lui : Je m'excuse pour l'omission dans ma réponse précédente. La variable $r représente chaque élément (configuration de route) du tableau $this->routes au fur et à mesure que la fonction array_filter parcourt le tableau. Permettez-moi de clarifier davantage :
//
//Dans l'expression fn ($r) => $uri === $r['uri'] && strtoupper($method) === $r['method'] :
//
//La partie ($r) indique que la fonction anonyme accepte un argument $r, qui est en réalité chaque élément du tableau $this->routes.
//
//À chaque itération de la fonction array_filter, $r représente un élément (une configuration de route) du tableau $this->routes.
//
//Ensuite, la condition $uri === $r['uri'] && strtoupper($method) === $r['method'] est vérifiée pour chaque élément du tableau. Cette condition vérifie si l'URI et la méthode correspondent à celles définies dans l'argument $uri et $method passés à la fonction routeToController.
//
//Donc, pour chaque élément de $this->routes, la fonction anonyme compare l'URI et la méthode avec les valeurs passées, et elle renvoie true si la condition est satisfaite et false sinon. Les éléments (configurations de route) pour lesquels la condition est true seront conservés dans le résultat final retourné par array_filter.



