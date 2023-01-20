<?php

require_once('database.php');

class Functions
{

	protected $pdo;

	
	public function __construct() // Создание нового инстанса БД
	{
		$db = new Database();
		$this->pdo = $db->connect();
	}

    
	public function getProbationaryPeriod($params)
	{
		$page = $params['page'] ?? 1;
		$limit = $params['limit'] ?? 10;
		$offset = ($page - 1) * $limit;

		$intervalDate = date('Y-m-d', strtotime('-3 months'));

		$sql = "SELECT user.first_name, user.last_name, user.middle_name, position.name as position, user_position.created_at as date_hired
					FROM user_position
					INNER JOIN user ON user_position.user_id = user.id
					INNER JOIN position ON user_position.position_id = position.id
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
			'data' => $employees,
			'pagination' => [
				'page' => $page,
				'limit' => $limit,
				'offset' => $offset
			]
		];
	}


	public function getDismissedEmployees($params)
	{
		$page = $params['page'] ?? 1;
		$limit = $params['limit'] ?? 10;
		$offset = ($page - 1) * $limit;

		$sql = "SELECT 
                    user.first_name, 
                    user.last_name, 
                    user.middle_name, 
                    position.name as position, 
                    dismission_reason.description as dismission_reason, 
                    dismission_reason.created_at as dismission_date
				FROM user_dismission
				INNER JOIN user_position 
                    ON user_position.user_id = user_dismission.user_id 
				INNER JOIN user 
                    ON user.id = user_dismission.user_id
				INNER JOIN position 
                    ON position.id = user_position.position_id
				INNER JOIN dismission_reason 
                    ON dismission_reason.id = user_dismission.reason_id
				LIMIT ? OFFSET ?";

		$stmt = $this->pdo->prepare($sql);
		$stmt->bindParam(1, $limit, PDO::PARAM_INT);
		$stmt->bindParam(2, $offset, PDO::PARAM_INT);
		$stmt->execute();
		$employees = $stmt->fetchAll();

		return [
			'status' => 'success',
			'data' => $employees,
			'pagination' => [
				'page' => $page,
				'limit' => $limit,
				'offset' => $offset
			]
		];
	}


	public function getLastHiredEmployees($params)
	{
		$page = $params['page'] ?? 1;
		$limit = $params['limit'] ?? 10;
		$offset = ($page - 1) * $limit;

		$sql = "SELECT 
                    user.first_name, 
                    user.last_name, 
                    user.middle_name, 
                    department.description, 
                    department.leader_id 
                FROM user_position
				INNER JOIN user 
                    ON user.id = user_position.user_id
				INNER JOIN department 
                    ON department.leader_id = user_position.position_id
				LIMIT ? OFFSET ?";

		$stmt = $this->pdo->prepare($sql);
		$stmt->bindParam(1, $limit, PDO::PARAM_INT);
		$stmt->bindParam(2, $offset, PDO::PARAM_INT);
		$stmt->execute();
		$bosses = $stmt->fetchAll();

		foreach ($bosses as $boss) {
			$sql = "SELECT 
                        user.first_name, 
                        user.last_name, 
                        user.middle_name, 
                        user.created_at as date_hired, 
                        position.name as position, 
                        position.salary FROM user_position
					INNER JOIN user 
                        ON user.id = user_position.user_id
					INNER JOIN position 
                        ON position.id = user_position.position_id
					WHERE user_position.position_id = ?
					ORDER BY user_position.created_at DESC
					LIMIT 1";

			$stmt = $this->pdo->prepare($sql);
			$stmt->bindParam(1, $boss->leader_id, PDO::PARAM_INT);
			$stmt->execute();
			$boss->last_hired = $stmt->fetch();

			unset($boss->leader_id);
			$bosses[] = $boss;
		}

		return [
			'status' => 'success',
			'data' => $bosses,
			'pagination' => [
				'page' => $page,
				'limit' => $limit,
				'offset' => $offset
			]
		];
	}
}
