DROP DATABASE IF EXISTS assignment1 ;
CREATE DATABASE Assignment1 ;
USE Assignment1;

DROP TABLE IF EXISTS `Department`;
CREATE TABLE `Department`(
    DepartmentID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(30) NOT NULL UNIQUE KEY
);
    
DROP TABLE IF EXISTS `Position` ;   
 CREATE TABLE `Position` (
    PositionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM( 'Dev','Test', 'Scrum Mater','PM') NOT NULL UNIQUE KEY
);
    
DROP TABLE IF EXISTS `Account` ;
CREATE TABLE `Account`(
    AccountID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(50) NOT NULL UNIQUE KEY,
    UserName VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName VARCHAR(50) NOT NULL,
    DepartmentID TINYINT UNSIGNED NOT NULL,
    PositionID TINYINT UNSIGNED NOT NULL,
    CreatorDate DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES `Department` (DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID)
);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
     GruopID TINYINT UNSIGNED AUTO_INCREMENT KEY,
     GroupName NCHAR(50) NOT NULL UNIQUE KEY,
     CreaotrDate DATETIME DEFAULT NOW(),
     FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
     );
     
DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE `GroupAccount`(
     GroupID TINYINT UNSIGNED NOT NULL,
     AccountID TINYINT UNSIGNED NOT NULL,
     JoiDate DATETIME  DEFAULT NOW(),
     PRIMARY KEY(GroupID , AccountID),
     FOREIGN KEY(GroupID) REFERENCES `Group` (GroupID),
     FOREIGN KEY(AccountID) REFERENCES `Account` (AccountID)
);
     
DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE `TypeQuestion` (
     TypeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     TypeName ENUM( 'Essay' , 'Multiple-Choice') NOT NULL UNIQUE KEY
);
     
DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE `CategoryQuestion`(
      QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
      CategoryName VARCHAR(50) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Question`;
CREATE TABLE `Question`(
      QuestionID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
      Content VARCHAR(100) NOT NULL,
      CategoryID TINYINT UNSIGNED NOT NULL,
      TypeID TINYINT UNSIGNED NOT NULL,
      CreatorID TINYINT UNSIGNED NOT NULL,
      CreatorDate DATETIME DEFAULT NOW(),
      FOREIGN KEY(CategoryID) REFERENCES `CategoryQuestion` (CategoryID),
      FOREIGN KEY(TypeID) REFERENCES `TypeQuestion`(TypeID),
      FOREIGN KEY(CreatorID) REFERENCES `Account` (AccountID)
);
  
DROP TABLE IF EXISTS `Answer`;
CREATE TABLE `Answer`(
      AnswerID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
      Content VARCHAR(100) NOT NULL,
      QuestionID TINYINT UNSIGNED NOT NULL,
      Iscorrect  BIT DEFAULT 1,
      FOREIGN KEY(QuestionID) REFERENCES `Question`(QuestionID)
);
 
 DROP TABLE IF EXISTS `Exam`;
 CREATE TABLE `Exam`(
      ExamID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
      `Code` CHAR(10) NOT NULL,
      Title VARCHAR(50) NOT NULL,
      CategoryID TINYINT UNSIGNED NOT NULL,
      DurationID TINYINT UNSIGNED NOT NULL,
      CreatorDate DATETIME DEFAULT NOW(),
      FOREIGN KEY(CategoryID) REFERENCES `CategoryQuestion`(CategoryID),
      FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS `ExamQuestion`;
CREATE TABLE `ExamQuestion`(
     ExamID TINYINT UNSIGNED NOT NULL,
     QuestionID TINYINT UNSIGNED NOT NULL,
     FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
     FOREIGN KEY(ExamID) REFERENCES `Exam`(ExamID),
     FOREIGN KEY(QuestionID) REFERENCES `Question`(QuestionID)
);
     
INSERT INTO `Department`(DepartmentName)
VALUES	('Marketing'),
		('Sale'),
		('B???o v???'),
		('Nh??n s???'),
		('K??? thu???t'),
		('T??i ch??nh'),
		('Ph?? gi??m ?????c'),
		('Gi??m ?????c'),
		('Th?? k??'),
		('No person'),
		('B??n h??ng');
 INSERT INTO `Position`(PositionNamne)
 VALUES ('Dev'),
                  ('Test'),
                  ('Scrum Mater'),
                  ('PM');

INSERT INTO `Account`(Email , Username, FullName , DepartmentID , PositionID, CreateDate)
 VALUES 	('Email1@gmail.com' ,'Username1' ,'Fullname1' , 5 , 1,'2020-03-05'),
                         ('Email2@gmail.com' ,'Username2' ,'Fullname2' , 1 , 2,'2020-03-05'),
		('Email3@gmail.com' , 'Username3' ,'Fullname3', 2 , 2 ,'2020-03-07'),
        ('Email4@gmail.com' , 'Username4' ,'Fullname4', 3 , 4 ,'2020-03-08'),
        ('Email5@gmail.com' , 'Username5' ,'Fullname5', 4 , 4 ,'2020-03-10'),
        ('Email6@gmail.com' , 'Username6' ,'Fullname6', 6 , 3 ,'2020-04-05'),
        ('Email7@gmail.com' , 'Username7' ,'Fullname7', 2 , 2 , NULL ),
        ('Email8@gmail.com' , 'Username8' ,'Fullname8', 8 , 1 ,'2020-04-07'),
        ('Email9@gmail.com' , 'Username9' ,'Fullname9', 2 , 2 ,'2020-04-07'),
        ('Email10@gmail.com' , 'Username10' ,'Fullname10', 10 , 1 ,'2020-04-09'),
        ('Email11@gmail.com' , 'Username11' ,'Fullname11', 10 , 1 , DEFAULT),
        ('Email12@gmail.com' , 'Username12','Fullname12' , 10 , 1 , DEFAULT);  
			
INSERT INTO `Group`(GroupName , CreatorID , CreateDate)
VALUES 	('Testing System' , 5,'2019-03-05'),
		('Development' , 1,'2020-03-07'),
		('VTI Sale 01' , 2 ,'2020-03-09'),
		('VTI Sale 02' , 3 ,'2020-03-10'),
		('VTI Sale 03' , 4 ,'2020-03-28'),
		('VTI Creator' , 6 ,'2020-04-06'),
		('VTI Marketing 01' , 7 ,'2020-04-07'),
		('Management' , 8 ,'2020-04-08'),
		('Chat with love' , 9 ,'2020-04-09'),
		('Vi Ti Ai' , 10 ,'2020-04-10');
INSERT INTO `GroupAccount`(GroupID , AccountID , JoinDate)
VALUES 	(1 , 1,'2019-03-05'),
		(1 , 2,'2020-03-07'),
		(3 , 3,'2020-03-09'),
		(3 , 4,'2020-03-10'),
		(5 , 5,'2020-03-28'),
		(1 , 3,'2020-04-06'),
		(1 , 7,'2020-04-07'),
		(8 , 3,'2020-04-08'),
		(1 , 9,'2020-04-09'),
		(10 , 10,'2020-04-10');           
            
INSERT INTO TypeQuestion(TypeName)
VALUES 	('Essay'),
		('Multiple-Choice');            

	INSERT INTO CategoryQuestion(CategoryName )
VALUES 	('Java'),
		('ASP.NET'),
		('ADO.NET'),
		('SQL'),
		('Postman'),
		('Ruby'),
		('Python'),
		('C++'),
		('C Sharp'),
		('PHP');
        
INSERT INTO Question(Content , CategoryID, TypeID , CreatorID, CreateDate)
VALUES 	('C??u h???i v??? Java' , 1 ,'1' , '2' ,'2020-04-05'),
		('C??u H???i v??? PHP' , 10 ,'2' , '2' ,'2020-04-05'),
		('H???i v??? C#' , 9 ,'2' , '3' ,'2020-04-06'),
		('H???i v??? Ruby' , 6 ,'1' , '4' ,'2020-04-06'),
		('H???i v??? Postman' , 5 ,'1' , '5' ,'2020-04-06'),
		('H???i v??? ADO.NET' , 3 ,'2' , '6' ,'2020-04-06'),
		('H???i v??? ASP.NET' , 2 ,'1' , '7' ,'2020-04-06'),
		('H???i v??? C++' , 8 ,'1' , '8' ,'2020-04-07'),
		('H???i v??? SQL' , 4 ,'2' , '9' ,'2020-04-07'),
		('H???i v??? Python' , 7 ,'1' , '10' ,'2020-04-07');
        
    INSERT INTO Answer(Content , QuestionID , isCorrect)
VALUES 	('Tr??? l???i 01' , 1 , 0),
		('Tr??? l???i 02' , 1 , 1),
		('Tr??? l???i 03', 1 , 0),
		('Tr??? l???i 04', 1 , 1),
		('Tr??? l???i 05', 2 , 1),
		('Tr??? l???i 06', 3 , 1),
		('Tr??? l???i 07', 4 , 0),
		('Tr??? l???i 08', 8 , 0),
		('Tr??? l???i 09', 9 , 1),
		('Tr??? l???i 10', 10 , 1);
        
INSERT INTO Exam (`Code` , Title , CategoryID, Duration , CreatorID , CreateDate )
VALUES 	('VTIQ001' , '????? thi C#' ,1 , 60 , '5' ,'2019-04-05'),
		('VTIQ002' , '????? thi PHP' ,10 , 60 , '2' ,'2019-04-05'),
		('VTIQ003' , '????? thi C++' , 9 ,120 , '2' ,'2019-04-07'),
		('VTIQ004' , '????? thi Java' , 6 , 60, '3' ,'2020-04-08'),
		('VTIQ005' , '????? thi Ruby' , 5 , 120, '4' ,'2020-04-10'),
		('VTIQ006' , '????? thi Postman' , 3 ,60 , '6' ,'2020-04-05'),
		('VTIQ007' , '????? thi SQL' , 2 ,60 , '7' ,'2020-04-05'),
		('VTIQ008' , '????? thi Python' , 8 ,60 , '8' ,'2020-04-07'),
		('VTIQ009' , '????? thi ADO.NET' , 4 ,90 , '9' ,'2020-04-07'),
		('VTIQ010' , '????? thi ASP.NET' , 7 ,90 , '10' ,'2020-04-08');    
        
INSERT INTO ExamQuestion(ExamID , QuestionID )
VALUES 	(1 , 5),
		(2 , 10),
		(3 , 4),
		(4 , 3),
		(5 , 7),
		(6 , 10),
		(7 , 2),
		(8 , 10),
		(9 , 9),
		(10 , 8);