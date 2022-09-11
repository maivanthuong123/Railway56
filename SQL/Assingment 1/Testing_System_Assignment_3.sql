DROP DATABASE IF EXISTS assignment1 ;
CREATE DATABASE Assignment1 ;
USE Assignment1;
-- lấy ra tất cả các phòng ban
SELECT  *
FROM    `Department`
ORDER BY DepartmentID;

-- lấy ra id của phòng ban "Sale"
SELECT  DepartmentID
FROM    `Department`
WHERE   Department  = 'Sale';
-- lấy ra thông tin account có full name dài nhất
SELECT  *
FROM    `Account`
WHERE length(FullName)  = (SELECT MAX(length(FullName))
                           FROM `Account`)
 ORDER BY AccountID;                          
 -- Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id = 3
WITH TEN_DAI_NHAT AS (SELECT *
                      FROM   `Account` 
                      WHERE   Department  =3
)
 SELECT *
 FROM `TEN_DAI_NHAT`
 WHERE length(FullName) = (SELECT MAX(length(FullName))
                           FROM  `TEN_DAI_NHAT`
 )
 ORDER BY FullName ;
-- 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT  GroupName, CreateDate
FROM  `Group`
WHERE  CreateDate < '2019/12/20' ;
-- 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT  A . QuestionID
FROM   `Answer` A
GROUP BY A.QuestionID
HAVING COUNT(A. Question) >= 4;
-- 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT `Code`
FROM    `Exam`
WHERE  Duration >= 60 AND CreateDate < 2019/12/20 ;
-- 9: Lấy ra 5 group được tạo gần đây nhất
SELECT *
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5 ;
-- 10: Đếm số nhân viên thuộc department có id = 2
SELECT COUNT (AccountID) AS NumberofAccuontDepartment2
FROM `Account`
WHERE DepartmentID = 2;
-- 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT   FullName
FROM     `Account`
WHERE    FullName LIKE 'D%O' ;
-- 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM Exam
WHERE CreateDate < 2019/12/20 ;
-- 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE FROM `Question`
WHERE    (SUBSTRING_INDEX(Content, ' ', 2)) = 'câu hỏi';
SELECT (SUBSTRING_INDEX(Content, ' ', 2)) = 'câu hỏi' FROM `Question`;
-- 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `Account`
SET Fullname = 'Nguyễn Bá Lộc',
         Email = 'loc.nguyenba@vti.com.vn'

WHERE AccountID = 5 ;
-- 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE `GroupAccount` 
SET 
    AccountID = 5
WHERE
    GroupID = 4;