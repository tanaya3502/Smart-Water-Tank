CREATE DATABASE smart_water_db;
use smart_water_db;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_date DATE NOT NULL,
    last_modified_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Building_Master (
    building_id INT AUTO_INCREMENT PRIMARY KEY,
    building_name VARCHAR(255) NOT NULL,
    building_created_date DATE NOT NULL,
    last_modified_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Tank_Master (
    tank_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    building_id INT NOT NULL,
    capacity INT NOT NULL,
    tank_created_date DATE NOT NULL,
    tank_last_modified_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (building_id) REFERENCES Building_Master(building_id) ON DELETE CASCADE
);

CREATE TABLE Sensor_Master (
    sensor_id INT AUTO_INCREMENT PRIMARY KEY,
    tank_id INT NOT NULL,
    date_time DATETIME NOT NULL,
    water_level FLOAT NOT NULL,
    sensor_last_modified_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (tank_id) REFERENCES Tank_Master(tank_id) ON DELETE CASCADE
);

CREATE TABLE Sensor_Reading (
    reading_id INT AUTO_INCREMENT PRIMARY KEY,
    sensor_id INT NOT NULL,
    reading FLOAT NOT NULL,
    sensor_reading_last_modified_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (sensor_id) REFERENCES Sensor_Master(sensor_id) ON DELETE CASCADE
);
