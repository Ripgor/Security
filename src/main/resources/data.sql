USE hello_java;

INSERT INTO roles (role) values ('ROLE_ADMIN'), ('ROLE_USER');

-- password = rinmin
INSERT INTO users (username, email, pass) values ('Ripgor', 'ripgor@gmail.com', 'rinmin');

INSERT INTO user_role (user_id, role_id) values (1, 1);