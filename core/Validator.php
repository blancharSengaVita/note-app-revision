<?php

namespace Core;

class Validator
{
	public static function between(string $description, int $min = 2, $max = INF)
	{
		return strlen($description) > $min && strlen($description) < $max;
	}
}