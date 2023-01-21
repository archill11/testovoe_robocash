<?php

require_once('../service/employeeService.php');

if(isset( $_POST['classMethod'] )) {
    
    $employeeService = new employeeService();

    $classMethod = $_POST['classMethod'];
    $pageValue =  $_POST['page'] ?? 1;


    // в зависимости от того какой метод указан в теле запроса, вызываю соответствующий ему
    if ($classMethod === "getAllEmployees") {
        $response = $employeeService->getAllEmployees($pageValue);
        echo $response;
    }

    if ($classMethod === "getProbationaryPeriod") {
        $response = $employeeService->getProbationaryPeriod($pageValue);
        echo $response;
    }

    if ($classMethod === "getDismissedEmployees") {
        $response = $employeeService->getDismissedEmployees($pageValue);
        echo $response;
    }

    if ($classMethod === "getLastHiredEmployees") {
        $response = $employeeService->getLastHiredEmployees($pageValue);
        echo $response;
    }
}


