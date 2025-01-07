CREATE TABLE IF NOT EXISTS crimes (
   crime_id INT AUTO_INCREM   
   crime_type VARCHAR(255) NOT NULL,
   crime_status INT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS crimes (
   crime_id INT AUTO_INCREMENT PRIMARY KEY,
   crime_type VARCHAR(255) NOT NULL,
   crime_status INT DEFAULT 1
);

CREATE TABLE IF NOT EXISTS state (
   state_id INT AUTO_INCREMENT PRIMARY KEY,
   state_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS district (
   district_id INT AUTO_INCREMENT PRIMARY KEY,
   district_name VARCHAR(255) NOT NULL,
   state_id INT,
   FOREIGN KEY (state_id) REFERENCES state(state_id)
);

CREATE TABLE IF NOT EXISTS police_station (
   police_station_id INT AUTO_INCREMENT PRIMARY KEY,
   police_station_name VARCHAR(255) NOT NULL,
   dist_id INT,
   FOREIGN KEY (dist_id) REFERENCES district(district_id)
);

CREATE TABLE IF NOT EXISTS victim_table (
   victim_id INT AUTO_INCREMENT PRIMARY KEY,
   victim_name VARCHAR(255) NOT NULL,
   victim_father_name VARCHAR(255) NOT NULL,
   age INT NOT NULL,
   gender VARCHAR(10) NOT NULL,
   address VARCHAR(255) NOT NULL,
   state_id INT,
   district_id INT,
   police_station_id INT,
   FOREIGN KEY (state_id) REFERENCES state(state_id),
   FOREIGN KEY (district_id) REFERENCES district(district_id),
   FOREIGN KEY (police_station_id) REFERENCES police_station(police_station_id)
);

CREATE TABLE IF NOT EXISTS criminal_table (
   criminal_id INT AUTO_INCREMENT PRIMARY KEY,
   criminal_name VARCHAR(255) NOT NULL,
   criminal_father_name VARCHAR(255) NOT NULL,
   age INT NOT NULL,
   gender VARCHAR(10) NOT NULL,
   address VARCHAR(255) NOT NULL,
   state_id INT,
   district_id INT,
   police_station_id INT,
   FOREIGN KEY (state_id) REFERENCES state(state_id),
   FOREIGN KEY (district_id) REFERENCES district(district_id),
   FOREIGN KEY (police_station_id) REFERENCES police_station(police_station_id)
);

CREATE TABLE IF NOT EXISTS crime_table (
   crime_id INT AUTO_INCREMENT PRIMARY KEY,
   location VARCHAR(255) NOT NULL,
   dateTime DATETIME NOT NULL,
   state_id INT,
   district_id INT,
   police_station_id INT,
   victim_id INT,
   criminal_id INT,
   FOREIGN KEY (state_id) REFERENCES state(state_id),
   FOREIGN KEY (district_id) REFERENCES district(district_id),
   FOREIGN KEY (police_station_id) REFERENCES police_station(police_station_id),
   FOREIGN KEY (victim_id) REFERENCES victim_table(victim_id),
   FOREIGN KEY (criminal_id) REFERENCES criminal_table(criminal_id)
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
    -- Add other columns as needed
);

INSERT INTO users (name, email, mobile, aadhar, password, date_register, ip_address)
VALUES ('Onwudiegwu Philip', 'Onwudiegwuphil.com', '08026607705', SHA2('password', chilz111)
, UNIX_TIMESTAMP(), '127.0.0.1');

INSERT INTO users (name, email, mobile, aadhar, password, date_register, ip_address)
VALUES ('Onwudiegwu Philip', 'elphilnel@gmail.com', '08026607705', '123456789012', SHA2('chilz111', 256), UNIX_TIMESTAMP(), '127.0.0.1');

ALTER TABLE users ADD COLUMN name VARCHAR(100);

DESCRIBE users;

ALTER TABLE users
ADD COLUMN mobile VARCHAR(15),
ADD COLUMN aadhar VARCHAR(12),
ADD COLUMN date_register BIGINT,
ADD COLUMN ip_address VARCHAR(15);

INSERT INTO users (name, email, mobile, aadhar, password, date_register, ip_address)
VALUES ('Onwudiegwu Philip', 'Onwudiegwuphil@gmail.com', '08026607705', '123456789012', SHA2('chilz111', 256), UNIX_TIMESTAMP(), '127.0.0.1');

SELECT * FROM users WHERE email = 'omwudiegwu.com';

TRUNCATE TABLE users;

ALTER TABLE users ADD COLUMN status INT;

