<?php

namespace Controller;

use Carbon\Carbon;


class CarbonTrainingController
{
	public function index(): void
	{
		$_SESSION['testCarbon'] = Carbon::now();

		$_SESSION['testCarbon'] = Carbon::now();
 		views_path('carbon/index.view.php');
	}
}

//on va arreter le projet pour essayer d'utiliser carbon
//https://carbon.nesbot.com/#gettingstarted