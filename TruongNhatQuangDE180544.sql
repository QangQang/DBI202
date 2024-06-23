CREATE DATABASE StudentManagement;

USE StudentManagement;

-- Câu 1:	
CREATE TABLE Department(
	ID INT PRIMARY KEY,
	Name NVARCHAR(50) UNIQUE,
	Phone VARCHAR(50)
	CONSTRAINT PK_Department PRIMARY KEY (ID)
);

-- Câu 2:
CREATE TABLE student (
    ID INT IDENTITY(1000,1) PRIMARY KEY,
    Firstname NVARCHAR(50),
    Lastname NVARCHAR(50),
    gender NVARCHAR(3) CHECK (gender IN (N'Nam', N'Nữ')),
    GPA FLOAT CHECK (GPA > 0),
    Address NVARCHAR(50) CHECK (Address = N'Đà Nẵng')
	CONSTRAINT PK_Student PRIMARY KEY (ID)
);

-- Câu 3:
INSERT INTO department (ID, name, phone)
VALUES 
(1,N'Phòng IT', '0123456789'),
(2,N'Phòng Kế toán', '0987654321'),
(3,N'Phòng Kỹ thuật', '0246813579'),
(4,N'Phòng Thư viện', '0135792468'),
(5,N'Phòng Tự học', '0125678943')

-- Câu 4:
INSERT INTO student (Firstname, Lastname, gender, GPA, Address)
VALUES 
(N'Trương', N'Nhật Quang', N'Nam', 4.0, N'Đà Nẵng'),
(N'Trà', N'Triệu Mẫn', N'Nam', 3.8, N'Đà Nẵng'),
(N'Nguyễn', N'Xuân Cường', N'Nam', 3.5, N'Đà Nẵng'),
(N'Nguyễn', N'Hữu Vương', N'Nam', 3.2, N'Đà Nẵng'),
(N'Mai', N'Thị Lệ Huyền', N'Nữ', 3.0, N'Đà Nẵng');

-- Câu 5:
SELECT * FROM student WHERE gender = N'Nữ'
-- Câu 6:
SELECT * FROM student WHERE gender = N'Nữ' OR Address = N'Đà Nẵng'

--Câu 7:
ALTER TABLE student ADD birthday DATE;

INSERT INTO student (Firstname, Lastname, gender, GPA, Address, birthday)
VALUES (N'Nguyễn', N'Phúc Tiên', N'Nữ', 4.0, N'Đà Nẵng', '2004-11-20');

--Câu 8:
ALTER TABLE student ADD DepartmentID INT;

ALTER TABLE student ADD CONSTRAINT FK_Student_Department FOREIGN KEY (DepartmentID) REFERENCES department(ID) ON UPDATE CASCADE;

--Câu 9:
UPDATE student SET DepartmentID = 1 WHERE DepartmentID IS NULL;

--Câu 10:
UPDATE department SET ID = 100 WHERE ID = 1;


SELECT * FROM student WHERE DepartmentID = 100;



-- Xóa student nếu nhập sai
DELETE FROM student;

-- Xóa department nếu nhập sai
DELETE FROM department;

-- Xóa bảng student
DROP TABLE IF EXISTS student;

-- Xóa bảng department
DROP TABLE IF EXISTS department;


--- Đém có bao nhiêu sinh viên theo từng phòng ban
SELECT DepartmentID, COUNT(ID) as 'Số lượng SV' FROM student GROUP BY DepartmentID

---Đếm có bao nhiêu sinh viên theo từng phòng ban, hiển thị thêm tên Department
SELECT s.DepartmentID, d.Name AS 'Tên Phòng Ban', COUNT(s.ID) AS 'Số lượng SV'
FROM student s
INNER JOIN Department d ON s.DepartmentID = d.ID
GROUP BY s.DepartmentID, d.Name;
