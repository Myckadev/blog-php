<?php

namespace App\Service;

use PDO;

final class Database
{
    private PDO $pdo;

    public function __construct(array $dbConfig)
    {
        $this->pdo = new PDO(...$dbConfig);
    }

    public function pdo(): PDO
    {
        return $this->pdo;
    }

}