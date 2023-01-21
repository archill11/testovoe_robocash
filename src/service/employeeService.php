<?php

require_once('../repository/employeeRepository.php');

class employeeService
{
    protected $employeeRepository;


    public function __construct() 
	{
		$this->employeeRepository = new employeeRepository();
	}

    /**
     * Метод получает данные из БД, мэпит их и возвращает клиенту 
     */
    public function getAllEmployees($page = 1)
    {
        // получение данных их БД
        $getAllEmployees = $this->employeeRepository->getAllEmployees([
            'page' => $page,
            'limit' => 10,
        ]);

        // проверка что такие сотрудники есть
        if (empty($getAllEmployees['data'])){
            return "Таких сотрудников не найдено!";
        }

        // подготовка ответа на клиент
        $response = 
            '<thead>
                <tr>
                    <th>ФИО</th>
                    <th>Должность</th>
                    <th>Дата приема на работу</th>
                    <th>дата увольнения</th>
                    <th>причина увольнения</th>
                    <th>Размер заработной платы</th>
                    <th>начальник</th>
                </tr>
            </thead>
            <tbody>';

        foreach ($getAllEmployees['data'] as $employe) {

            $response.= "<tr>";

            foreach($employe as $field) {
                $response.= "<td>{$field}</td>";
            }

            $response.= "</tr>";
        }

        $response.= "</tbody>";


        return $response;
    }

    /**
     * Метод получает данные из БД, мэпит их и возвращает клиенту 
     */
    public function getProbationaryPeriod($page = 1)
    {
        // получение данных их БД
        $getAllEmployees = $this->employeeRepository->getProbationaryPeriod([
            'page' => $page,
            'limit' => 10
        ]);

        // проверка что такие сотрудники есть
        if (empty($getAllEmployees['data'])){
            return "Таких сотрудников не найдено!";
        }

        // подготовка ответа на клиент
        $response = 
            '<thead>
                <tr>
                    <th>ФИО</th>
                    <th>Должность</th>
                    <th>Дата приема на работу</th>
                    <th>дата увольнения</th>
                    <th>причина увольнения</th>
                    <th>Размер заработной платы</th>
                    <th>начальник</th>
                </tr>
            </thead>
            <tbody>';

        foreach ($getAllEmployees['data'] as $employe) {

            $response.= "<tr>";

            foreach($employe as $field) {
                $response.= "<td>{$field}</td>";
            }

            $response.= "</tr>";
        }

        $response.= "</tbody>";


        return $response;
    }

    /**
     * Метод получает данные из БД, мэпит их и возвращает клиенту 
     */
    public function getDismissedEmployees($page = 1)
    {
        // получение данных их БД
        $getAllEmployees = $this->employeeRepository->getDismissedEmployees([
            'page' => $page,
            'limit' => 10
        ]);

        // проверка что такие сотрудники есть
        if (empty($getAllEmployees['data'])){
            return "Таких сотрудников не найдено!";
        }

        // подготовка ответа на клиент
        $response = 
            '<thead>
                <tr>
                    <th>ФИО</th>
                    <th>Должность</th>
                    <th>Дата приема на работу</th>
                    <th>дата увольнения</th>
                    <th>причина увольнения</th>
                </tr>
            </thead>
            <tbody>';

        foreach ($getAllEmployees['data'] as $employe) {

            $response.= "<tr>";

            foreach($employe as $field) {
                $response.= "<td>{$field}</td>";
            }

            $response.= "</tr>";
        }

        $response.= "</tbody>";


        return $response;
    }

    /**
     * Метод получает данные из БД, мэпит их и возвращает клиенту 
     */
    public function getLastHiredEmployees($page = 1)
    {
        // получение данных их БД
        $getAllEmployees = $this->employeeRepository->getLastHiredEmployees([
            'page' => $page,
            'limit' =>10
        ]);

        // проверка что такие сотрудники есть
        if (empty($getAllEmployees['data'])){
            return "Таких сотрудников не найдено!";
        }

        // подготовка ответа на клиент
        $response = 
            '<thead>
                <tr>
                    <th>ФИО</th>
                    <th>Должность</th>
                    <th>Дата приема на работу сотрудника</th>
                    <th>Размер заработной платы</th>
                    <th>Начальник</th>
                    <th>Отдел</th>
                </tr>
            </thead>
            <tbody>';

        foreach ($getAllEmployees['data'] as $employe) {

            $response.= "<tr>";

            foreach($employe as $field) {
                $response.= "<td>{$field}</td>";
            }

            $response.= "</tr>";
        }

        $response.= "</tbody>";


        return $response;
    }

}


