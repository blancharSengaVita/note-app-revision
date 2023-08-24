<?php

namespace core;

class Response
{
	public const NOT_FOUND = 404;
	public const FORBIDDEN = 403;
	public const METHOD_NOT_ALLOW = 405;
	public const BAD_REQUEST = 400;

	public static function abort($code = self::NOT_FOUND){
		http_response_code($code);
		views_path("codes/{$code}.view.php", compact('code'));
		die();
	}
}