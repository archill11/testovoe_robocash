<?php

require_once('../service/employeeService.php');

if(isset( $_POST['sortMethod'] )) {
    $sortMethod = $_POST['sortMethod'];
    $pageValue =  $_POST['page'] ?? 1;

    $employeeService = new employeeService();

    if ($sortMethod === "getAllEmployees") {
        $response = $employeeService->getAllEmployees($pageValue);
        echo $response;
    }

    if ($sortMethod === "getProbationaryPeriod") {
        $response = $employeeService->getProbationaryPeriod($pageValue);
        echo $response;
    }

    if ($sortMethod === "getDismissedEmployees") {
        $response = $employeeService->getDismissedEmployees($pageValue);
        echo $response;
    }

    if ($sortMethod === "getLastHiredEmployees") {
        $response = $employeeService->getLastHiredEmployees($pageValue);
        echo $response;
    }
}


