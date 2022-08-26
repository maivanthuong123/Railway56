
DROP DATABASE IF EXISTS Testing_System_Assignment_1 ;
CREATE DATABASE Testing_System_Assignment_1 ;
USE Testing_System_Assignment_1 ;

-- Tạo Table Deparment
-- update để test Gỉt
DROP TABLE IF EXISTS `Deparment`;
CREATE TABLE  `Deparment` (
	DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(30) NOT NULL UNIQUE KEY  
    );
	DROP DATABASE IF EXISTS Position;
 CREATE TABLE `Position`(
     	PositionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,			
		PositionName	ENUM( Dev`,`Test`,`Scrum Master`,`PM`) NOT NULL UNIQUE KEY	 
        ); 		
DROP TABLE IF EXISTS `Account`;		
CREATE TABLE `Account`(						
		AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,				
		Email VARCHAR(50)NOT NULL UNIQUE KEY,				
		Username VARCHAR(50)NOT NULL UNIQUE KEY,				
		FullName NVARCHAR(50) NOT NULL,				
					
						(N'Waitting Room');

