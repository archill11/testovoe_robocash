<?php

class Database
{

	private $host;
	private $name;
	private $user;
	private $password;

	public function __construct() // Загружаем конфиг БД из config.php и внедряем зависимовти
	{
		$config = require_once('config.php');
		$this->host = $config['database']['host'];
		$this->name = $config['database']['name'];
		$this->user = $config['database']['user'];
		$this->password = $config['database']['password'];
	}

	public function connect() // подключение к БД и возврат PDO object
	{
		$dsn = "mysql:host={$this->host};dbname={$this->name}";
		$pdo = new PDO($dsn, $this->user, $this->password);
		$pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
		return $pdo;
	}
}
