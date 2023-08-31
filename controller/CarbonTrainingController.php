<?php

namespace Controller;

use Carbon\Carbon;
use Carbon\CarbonImmutable;


class CarbonTrainingController
{
	public function index(): void
	{
 		views_path('carbon/index.view.php');
		echo 'now : ';
		echo Carbon::now();
		echo '<hr/>';
		echo 'now at paris : ';
		echo Carbon::now('Europe/Paris');
		echo '<hr/>';
		echo 'now today : ';
		echo Carbon::today();
		echo '<hr/>';
		echo 'now tommorow : ';
		echo Carbon::tomorrow();
		echo '<hr/>';
		echo 'now yesterday : ';
		echo Carbon::yesterday();
		echo '<hr/>';
		echo 'now year month day hour minute seconde : ';
		echo Carbon::now('Europe/Paris')->year . '<br>';
		echo Carbon::now('Europe/Paris')->month . '<br>';
		echo Carbon::now('Europe/Paris')->day . '<br>';
		echo Carbon::now('Europe/Paris')->hour . '<br>';
		echo Carbon::now('Europe/Paris')->minute . '<br>';
		echo Carbon::now('Europe/Paris')->second . '<br>';
		echo '<hr/>';
		echo 'now year month day hour minute seconde : ';
		echo Carbon::now()->subMonth(1);
		echo '<hr/>';
		echo 'now parse and format : ';
		echo Carbon::parse(Carbon::now())->format('F');
		echo '<hr/>';
		echo 'now parse and format and fr : ';
		echo Carbon::parse('Europe/Paris')->locale('fr')->format('l, d F H:i:s');
		echo '<hr/>';
		echo 'test iso format : ';
		echo Carbon::now('Europe/Paris')->locale('fr')->isoFormat('dddd, MMMM Do, YYYY, HH:mm');
		echo '<hr/>';
		echo 'test format : ';
		echo Carbon::now('Europe/Paris')->locale('fr')->Format('D,M,Y H:i:s');
		echo '<hr/>';
		echo 'Carbon Immutable : ';
		echo CarbonImmutable::now();
		echo '<hr/>';
		echo 'raw date : ';
		echo 'Le ' . ucfirst(Carbon::parse('2023-07-31 21:42:42', 'Europe/Paris')->locale('fr')->isoFormat('dddd D MMMM, '));
		echo '<hr/>';
		echo Carbon::now();
		echo '<hr/>';
		echo Carbon::parse('2012-9-5 23:26:11.223', 'Europe/Paris')->timezone->getName();
		echo '<hr/>';
//		echo new Carbon('naasaande, juko 31st, 2023, 8:56', );
//		echo '<hr/>';
		echo '<p>';
		echo '
d: Day of the month (01 to 31) <br/>
D: Short textual representation of the day (Mon to Sun) <br/>
j: Day of the month without leading zeros (1 to 31) <br/>
l: Full textual representation of the day (Sunday to Saturday) <br/>
F: Full textual representation of the month (January to December) <br/>
m: Month with leading zeros (01 to 12) <br/>
M: Short textual representation of the month (Jan to Dec) <br/>
n: Month without leading zeros (1 to 12) <br/>
Y: Year with century (e.g., 2023) <br/>
y: Year without century (e.g., 23) <br/>
H: Hour in 24-hour format with leading zeros (00 to 23) <br/>
h: Hour in 12-hour format with leading zeros (01 to 12) <br/>
i: Minutes with leading zeros (00 to 59) <br/>
s: Seconds with leading zeros (00 to 59) <br/>
A: Uppercase Ante meridiem and Post meridiem (AM or PM) <br/>
a: Lowercase ante meridiem and post meridiem (am or pm) <br/>
U: Unix timestamp (seconds since January 1, 1970) <br>
w: Numeric representation of the day of the week (0 for Sunday, 6 for Saturday) <br>
N: ISO-8601 numeric representation of the day of the week (1 for Monday, 7 for Sunday) <br>
z: Day of the year (0 to 365) <br>
W: ISO-8601 week number of the year (weeks starting on Monday) <br>
L: Whether it\'s a leap year (1 for leap year, 0 otherwise) <br>
o: ISO-8601 year (similar to Y, but considers week 1 of next year as the first week) <br>
G: Hour in 24-hour format without leading zeros (0 to 23) <br>
g: Hour in 12-hour format without leading zeros (1 to 12) <br>
e: Timezone identifier (e.g., "UTC", "America/New_York") <br>
I: Whether it\'s daylight saving time (1 if DST, 0 otherwise) <br>
O: Difference to Greenwich time (GMT) in hours (e.g., +0200) <br>
P: Difference to Greenwich time (GMT) with colon (e.g., +02:00) <br>
T: Timezone abbreviation (e.g., "CEST") <br>
c: ISO 8601 date and time format (e.g., 2023-08-31T15:30:00+02:00) <br>
r: RFC 2822 formatted date (e.g., Wed, 31 Aug 2023 15:30:00 +0200) <br>
';
		echo '<p>';
	}
}

//on va arreter le projet pour essayer d'utiliser carbon
//https://carbon.nesbot.com/#gettingstarted