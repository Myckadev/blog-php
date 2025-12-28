CREATE TABLE users
(
    id            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email         VARCHAR(190) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role          ENUM('ROLE_ADMIN', 'ROLE_USER') NOT NULL DEFAULT 'ROLE_USER',
    is_validated  TINYINT(1) NOT NULL DEFAULT 1,
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE posts
(
    id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title      VARCHAR(255) NOT NULL,
    chapo      VARCHAR(500) NOT NULL,
    content    TEXT         NOT NULL,
    author     VARCHAR(120) NOT NULL,
    created_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX      idx_posts_updated_at (updated_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE comments
(
    id           INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    post_id      INT UNSIGNED NOT NULL,
    author_name  VARCHAR(120) NOT NULL,
    author_email VARCHAR(190) NOT NULL,
    content      TEXT         NOT NULL,
    status       ENUM('pending', 'approved', 'rejected') NOT NULL DEFAULT 'pending',
    created_at   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_comments_post
        FOREIGN KEY (post_id) REFERENCES posts (id)
            ON DELETE CASCADE,
    INDEX        idx_comments_post_status (post_id, status),
    INDEX        idx_comments_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
