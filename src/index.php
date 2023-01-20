<?php


require_once('./repository/functions.php');

$functions = new Functions();


/* Calling the function getLastHiredEmployees from the class Functions. */
$getLastHiredEmployees = $functions->getLastHiredEmployees([
	'page' => 1,
	'limit' => 10
]);

print_r($getLastHiredEmployees);