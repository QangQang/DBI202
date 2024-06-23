USE FUH_COMPANY

--1.	Cho biết ai đang quản lý phòng ban có tên: Phòng Nghiên cứu và phát triển. Thông tin yêu cầu: mã số,họ tên nhân viên, mã số phòng ban, tên phòng ban
SELECT e.empSSN, e.empName, e.depNum, d.depName
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
WHERE d.depName = N'Phòng Nghiên cứu và phát triển';

--2.	Cho phòng ban có tên: Phòng Nghiên cứu và phát triển hiện đang quản lý dự án nào. Thông tin yêu cầu: mã số dụ án, tên dự án, tên phòng ban quản lý
SELECT p.proNum, p.proName, d.depName
FROM tblProject p
JOIN tblDepartment d ON p.depNum = d.depNum
WHERE d.depName = N'Phòng Nghiên cứu và phát triển';

--3.	Cho biết dự án có tên ProjectB hiện đang được quản lý bởi phòng ban nào. Thông tin yêu cầu: mã số dụ án, tên dự án, tên phòng ban quản lý
SELECT p.proNum, p.proName, d.depName
FROM tblProject p
JOIN tblDepartment d ON p.depNum = d.depNum
WHERE p.proName = 'ProjectB';

--4.	Cho biết những nhân viên nào đang bị giám sát bởi nhân viên có tên Mai Duy An. Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên
SELECT e.empSSN, e.empName
FROM tblEmployee e
JOIN tblEmployee s ON e.supervisorSSN = s.empSSN
WHERE s.empName = 'Mai Duy An';

--5.	Cho biết ai hiện đang giám sát những nhân viên có tên Mai Duy An. Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên giám sát.
SELECT s.empSSN, s.empName
FROM tblEmployee e
JOIN tblEmployee s ON e.supervisorSSN = s.empSSN
WHERE e.empName = 'Mai Duy An';

--6.	Cho biết dự án có tên ProjectA hiện đang làm việc ở đâu. Thông tin yêu cầu: mã số, tên vị trí làm việc.
SELECT l.locNum, l.locName
FROM tblProject p
JOIN tblLocation l ON p.locNum = l.locNum
WHERE p.proName = 'ProjectA';

--7.	Cho biết vị trí làm việc có tên Tp. HCM hiện đang là chỗ làm việc của những dự án nào. Thông tin yêu cầu: mã số, tên dự án
SELECT p.proNum, p.proName
FROM tblProject p
JOIN tblLocation l ON p.locNum = l.locNum
WHERE l.locName = N'TP Hồ Chí Minh';

--8.	Cho biết những người phụ thuộc trên 18 tuổi .Thông tin yêu cầu: tên, ngày tháng năm sinh của người phụ thuộc, tên nhân viên phụ thuộc vào.
SELECT d.depName AS 'Dependent', d.depBirthdate, e.empName AS 'Employee'
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
WHERE DATEDIFF(year, d.depBirthdate, GETDATE()) > 18;

--9.	Cho biết những người phụ thuộc là nam giới. Thông tin yêu cầu: tên, ngày tháng năm sinh của người phụ thuộc, tên nhân viên phụ thuộc vào 
SELECT d.depName AS 'Dependent', d.depBirthdate, e.empName AS 'Employee'
FROM tblDependent d
JOIN tblEmployee e ON d.empSSN = e.empSSN
WHERE d.depSex = 'M';

--10.	Cho biết những nơi làm việc của phòng ban có tên : Phòng Nghiên cứu và phát triển. Thông tin yêu cầu: mã phòng ban, tên phòng ban, tên nơi làm việc.
SELECT d.depNum, d.depName, l.locName
FROM tblProject p
JOIN tblDepartment d ON p.depNum= d.depNum
JOIN tblLocation l ON p.locNum= l.locNum
WHERE d.depName = N'Phòng Nghiên cứu và phát triển';

--11.	Cho biết các dự án làm việc tại Tp. HCM. Thông tin yêu cầu: mã dự án, tên dự án, tên phòng ban chịu trách nhiệm dự án.
SELECT p.proNum, p.proName, d.depName
FROM tblProject p
JOIN tblLocation l ON p.locNum = l.locNum
JOIN tblDepartment d ON p.depNum = d.depNum
WHERE l.locName = N'TP Hồ Chí Minh';

--12.	Cho biết những người phụ thuộc là nữ giới, của nhân viên thuộc phòng ban có tên: Phòng Nghiên cứu và phát triển . Thông tin yêu cầu: tên nhân viên, tên người phụ thuộc, mối liên hệ giữa người phụ thuộc với nhân viên
SELECT e.empName, d.depNum--, dep.depName AS DependentName, dep.depRelationship
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
JOIN tblDependent dep ON e.empName = dep.empSSN
WHERE dep.depSex = 'F' AND d.depName = N'Phòng Nghiên cứu và phát triển'; 

--13.	Cho biết những người phụ thuộc trên 18 tuổi, của nhân viên thuộc phòng ban có tên: Phòng Nghiên cứu và phát triển. Thông tin yêu cầu: tên nhân viên, tên người phụ thuộc, mối liên hệ giữa người phụ thuộc với nhân viên
SELECT e.empName, dep.depName AS dependentName, dep.depRelationship
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
JOIN tblDependent dep ON e.empSSN = dep.empSSN
WHERE d.depName = N'Phòng Nghiên cứu và phát triển' AND DATEDIFF(year, dep.depBirthdate, GETDATE()) > 18;


--14.	Cho biết số lượng người phụ thuộc theo giới tính. Thông tin yêu cầu: giới tính, số lượng người phụ thuộc
SELECT depSex, COUNT(*) AS numDependents
FROM tblDependent 
GROUP BY depSex

--15.	Cho biết số lượng người phụ thuộc theo mối liên hệ với nhân viên. Thông tin yêu cầu: mối liên hệ, số lượng người phụ thuộc
SELECT depRelationship, COUNT(*) AS numDependents
FROM tblDependent
GROUP BY depRelationship

--16.	Cho biết số lượng người phụ thuộc theo mỗi phòng ban. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc
SELECT d.depNum, d.depName, COUNT(dep.depName) AS numDependents
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
JOIN tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY d.depNum, d.depName;



