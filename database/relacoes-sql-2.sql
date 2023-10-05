-- Active: 1696457231362@@127.0.0.1@3306

-- Práticas

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME('now','localtime')) NOT NULL
    );

INSERT INTO users (id, name, email, password) 
VALUES 
('U001', 'Gabigol', 'gabi@gmail.com', 'vsdfbsfb'),
('U002', 'bigol', 'bi@gmail.com', 'djfdg'),
('U003', 'igol', 'igol@gmail.com', 'fsdgjlfb');

CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followeD_id) REFERENCES users (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO follows 
VALUES 
('U001', 'U002'),
('U001', 'U003'),
('U002', 'U001');

SELECT * FROM users
INNER JOIN follows
ON follows.follower_id = users.id;

SELECT * FROM users
LEFT JOIN follows
ON follows.follower_id = users.id;

SELECT * FROM users
LEFT JOIN follows
ON follows.followed_id = users.id;

-- Prática Principal

SELECT A.name AS 'Quem segue', B.name AS 'Quem ta sendo seguido'
FROM follows AS f
FULL JOIN users AS A ON f.follower_id = A.id
LEFT JOIN users AS B ON f.followed_id = B.id;

-- Procurar sobre MVC