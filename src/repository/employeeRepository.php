<?php

require_once('database.php');

class employeeRepository
{

	protected $pdo;

	
	public function __construct() // Создание нового инстанса БД
	{
		$db = new Database();
		$this->pdo = $db->connect();
	}

    
	public function getAllEmployees($params)
	{

		$page = $params['page'] ?? 1;
		$limit = $params['limit'] ?? 10;
		$offset = ($page - 1) * $limit;


		$sql = "SELECT 
                    CONCAT(user.first_name, ' ', user.last_name, ' ', user.middle_name),
                    position.name as position,
                    user_position.created_at as date_hired,
                    IFNULL(user_dismission.created_at, 'Отсутствует') as dismission_date,
                    IFNULL(dismission_reason.description, 'Отсутствует') as dismission_reason,
                    position.salary as salary,
                    boss.boss_name
				FROM user_position
				LEFT JOIN user 
                    ON user_position.user_id = user.id
                LEFT JOIN position 
                    ON user_position.position_id = position.id
                LEFT JOIN user_dismission 
                    ON user_dismission.user_id = user_position.user_id
                LEFT JOIN dismission_reason 
                    ON user_dismission.reason_id = dismission_reason.id
                LEFT JOIN department 
                    ON user_position.department_id = department.id
                LEFT JOIN (
                            SELECT 
                                user.id,
                                CONCAT(user.first_name, ' ', user.last_name, ' ', user.middle_name) as boss_name,
                                department.id as department_id
                            FROM user
                            RIGHT JOIN department
                                ON user.id = department.leader_id
                            ) as boss
                    ON user_position.department_id = boss.department_id
				LIMIT ? OFFSET ?";

		$stmt = $this->pdo->prepare($sql);
		$stmt->bindParam(1, $limit, PDO::PARAM_INT);
		$stmt->bindParam(2, $offset, PDO::PARAM_INT);
		$stmt->execute();
		$employees = $stmt->fetchAll();

		return [
			'status' => 'success',
			'data' => $employees
		];
	}

	public function getProbationaryPeriod($params)
	{
		$page = $params['page'] ?? 1;
		$limit = $params['limit'] ?? 10;
		$offset = ($page - 1) * $limit;

		$intervalDate = date('Y-m-d', strtotime('-3 months'));

		$sql = "SELECT 
                    user.first_name, 
                    user.last_name, 
                    user.middle_name, 
                    position.name as position, 
                    user_position.created_at as date_hired
				FROM user_position
				LEFT JOIN user 
                    ON user_position.user_id = user.id
                LEFT JOIN position 
                    ON user_position.position_id = position.id
				WHERE DATE(user_position.created_at) >= DATE(?) AND DATE(user_position.created_at) <= DATE(NOW())
				LIMIT ? OFFSET ?";

		$stmt = $this->pdo->prepare($sql);
		$stmt->bindParam(1, $intervalDate, PDO::PARAM_STR);
		$stmt->bindParam(2, $limit, PDO::PARAM_INT);
		$stmt->bindParam(3, $offset, PDO::PARAM_INT);
		$stmt->execute();
		$employees = $stmt->fetchAll();

		return [
			'status' => 'success',
			'data' => $employees
		];
	}


	public function getDismissedEmployees($params)
	{
		$page = $params['page'] ?? 1;
		$limit = $params['limit'] ?? 10;
		$offset = ($page - 1) * $limit;

		$sql = "SELECT 
                    CONCAT(user.first_name, ' ', user.last_name, ' ', user.middle_name) as name,
                    position.name as position, 
                    user.created_at,
                    user_dismission.created_at as dismission_date,
                    dismission_reason.description as dismission_reason
				FROM user_dismission
				LEFT JOIN user_position 
                    ON user_position.user_id = user_dismission.user_id 
                LEFT JOIN user 
                    ON user.id = user_dismission.user_id
                LEFT JOIN position 
                    ON position.id = user_position.position_id
                LEFT JOIN dismission_reason 
                    ON dismission_reason.id = user_dismission.reason_id
				LIMIT ? OFFSET ?";

		$stmt = $this->pdo->prepare($sql);
		$stmt->bindParam(1, $limit, PDO::PARAM_INT);
		$stmt->bindParam(2, $offset, PDO::PARAM_INT);
		$stmt->execute();
		$employees = $stmt->fetchAll();

		return [
			'status' => 'success',
			'data' => $employees
		];
	}


	public function getLastHiredEmployees($params)
	{
		$page = $params['page'] ?? 1;
		$limit = $params['limit'] ?? 10;
		$offset = ($page - 1) * $limit;


        $sql = 
            "SELECT
                CONCAT(user.first_name, ' ', user.last_name, ' ', user.middle_name) as last_hired_employee_name,
                position.name as last_hired_employee_position,
                empl.created_at,
                position.salary,
                CONCAT(boss.first_name, ' ', boss.last_name, ' ', boss.middle_name) as leader_name,
                department.description
            FROM user_position as empl
            RIGHT JOIN (  
                    SELECT 
                        empl.department_id as maxim_department, 
                        MAX(empl.created_at) as maxim
                        -- MAX(empl.id) as maxim_id
                    FROM user_position as empl
                    GROUP BY empl.department_id
                  ) as last_empl
                ON empl.department_id = last_empl.maxim_department 
                    AND empl.created_at = last_empl.maxim 
                    -- AND empl.id = last_empl.maxim_id
            JOIN user
                ON user.id = empl.user_id
            JOIN position
                ON position.id = empl.position_id
            JOIN department
                ON department.id = empl.department_id
            JOIN user as boss
                ON boss.id = department.leader_id
            LIMIT ? OFFSET ?";

		$stmt = $this->pdo->prepare($sql);
		$stmt->bindParam(1, $limit, PDO::PARAM_INT);
		$stmt->bindParam(2, $offset, PDO::PARAM_INT);
		$stmt->execute();
		$bosses = $stmt->fetchAll();


		return [
			'status' => 'success',
			'data' => $bosses
		];
	}
}
