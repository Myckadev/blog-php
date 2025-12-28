<?php

namespace BlogPhp\Service;

use PDO;

final class Database
{
    private PDO $pdo;

    public function __construct(array $dbConfig)
    {
        $this->pdo = new PDO(
            $dbConfig['dsn'],
            $dbConfig['user'],
            $dbConfig['password'],
            $dbConfig['options']
        );
    }

    public function pdo(): PDO
    {
        return $this->pdo;
    }

}