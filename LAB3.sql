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

--17.	Cho biết phòng ban nào có số lượng người phụ thuộc là ít nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc
SELECT TOP 1 d.depNum, d.depName, COUNT(dep.depName) AS numDependents
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
JOIN tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY d.depNum, d.depName
ORDER BY numDependents ASC;

--18.	Cho biết phòng ban nào có số lượng người phụ thuộc là nhiều nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng người phụ thuộc
SELECT TOP 1 d.depNum, d.depName, COUNT(dep.depName) AS numDependents
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
JOIN tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY d.depNum, d.depName
ORDER BY numDependents DESC;

--19.	Cho biết tổng số giờ tham gia dự án của mỗi nhân viên. Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
SELECT e.empSSN, e.empName, d.depName, SUM(w.workHours) AS totalWorkHours
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
JOIN tblWorksOn w ON e.empSSN = w.empSSN
GROUP BY e.empSSN, e.empName, d.depName;

--20.	Cho biết tổng số giờ làm dự án của mỗi phòng ban. Thông tin yêu cầu: mã phòng ban,  tên phòng ban, tổng số giờ
SELECT d.depNum, d.depName, SUM(w.workHours) AS totalWorkHours
FROM tblWorkson w
JOIN tblProject p ON w.proNum = p.proNum
JOIN tblDepartment d ON p.depNum = d.depNum
GROUP BY d.depNum, d.depName;

--21.	Cho biết nhân viên nào có số giờ tham gia dự án là ít nhất. Thông tin yêu cầu: mã nhân viên, tên nhân viên, tổng số giờ tham gia dự án
SELECT TOP 1 e.empSSN, e.empName, SUM(w.workHours) AS totalWorkHours
FROM tblWorksOn w
JOIN tblEmployee e ON w.empSSN = e.empSSN
GROUP BY e.empSSN, e.empName
ORDER BY totalWorkHours ASC; 

--22.	Cho biết nhân viên nào có số giờ tham gia dự án là nhiều nhất. Thông tin yêu cầu: mã nhân viên, tên nhân viên, tổng số giờ tham gia dự án
SELECT TOP 1 e.empSSN, e.empName, SUM(w.workHours) AS totalWorkHours
FROM tblWorksOn w
JOIN tblEmployee e ON w.empSSN = e.empSSN
GROUP BY e.empSSN, e.empName
ORDER BY totalWorkHours DESC;

--23.	Cho biết những nhân viên nào lần đầu tiên tham gia dụ án. Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
SELECT e.empSSN, e.empName, d.depName
FROM tblEmployee e
JOIN tblWorksOn w ON e.empSSN = w.empSSN
JOIN tblDepartment d ON e.depNum = d.depNum
GROUP BY e.empSSN, e.empName, d.depName
HAVING COUNT(w.proNum) = 1;

--24.	Cho biết những nhân viên nào lần thứ hai tham gia dụ án. Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
SELECT e.empSSN, e.empName, d.depName
FROM tblEmployee e
JOIN tblWorksOn w ON e.empSSN = w.empSSN
JOIN tblDepartment d ON e.depNum = d.depNum
GROUP BY e.empSSN, e.empName, d.depName
HAVING COUNT(w.proNum) = 2;

--25.	Cho biết những nhân viên nào tham gia tối thiểu hai dụ án. Thông tin yêu cầu: mã nhân viên, tên nhân viên, tên phòng ban của nhân viên
SELECT e.empSSN, e.empName, d.depName
FROM tblEmployee e
JOIN tblWorksOn w ON e.empSSN = w.empSSN
JOIN tblDepartment d ON e.depNum = d.depNum
GROUP BY e.empSSN, e.empName, d.depName
HAVING COUNT(w.proNum) >= 2;

--26.	Cho biết số lượng thành viên của mỗi dự án. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên
SELECT p.proNum, p.proName, COUNT(w.empSSN) AS MemberCount
FROM tblProject p
JOIN tblWorksOn w ON p.proNum = w.proNum
GROUP BY p.proNum, p.proName;

--27.	Cho biết tổng số giờ làm của mỗi dự án. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
SELECT p.proNum, p.proName, SUM(w.workHours) AS totalWorkHours
FROM tblProject p
JOIN tblWorksOn w ON p.proNum = w.proNum
GROUP BY p.proNum, p.proName;

--28.	Cho biết dự án nào có số lượng thành viên là ít nhất. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên
SELECT TOP 1 p.proNum, p.proName, COUNT(w.empSSN) AS memberCount
FROM tblProject p
JOIN tblWorksOn w ON p.proNum = w.proNum
GROUP BY p.proNum, p.proName
ORDER BY memberCount ASC;

--29.	Cho biết dự án nào có số lượng thành viên là nhiều nhất. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên
SELECT TOP 1 p.proNum, p.proName, COUNT(w.empSSN) AS memberCount
FROM tblProject p
JOIN tblWorksOn w ON p.proNum = w.proNum
GROUP BY p.proNum, p.proName
ORDER BY memberCount DESC;

--30.	Cho biết dự án nào có tổng số giờ làm là ít nhất. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
SELECT TOP 1 p.proNum, p.proName, SUM(w.workHours) AS totalWorkHours
FROM tblProject p
JOIN tblWorksOn w ON p.proNum = w.proNum
GROUP BY p.proNum, p.proName
ORDER BY totalWorkHours ASC;

--31.	Cho biết dự án nào có tổng số giờ làm là nhiều nhất. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
SELECT TOP 1 p.proNum, p.proName, SUM(w.workHours) AS totalWorkHours
FROM tblProject p
JOIN tblWorksOn w ON p.proNum = w.proNum
GROUP BY p.proNum, p.proName
ORDER BY totalWorkHours DESC;

--32.	Cho biết số lượng phòng ban làm việc theo mỗi nơi làm việc. Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban
SELECT l.locName, COUNT(dl.depNum) AS DepartmentCount
FROM tblLocation l
JOIN tblDepLocation dl ON l.locNum = dl.locNum
GROUP BY l.locName;

--33.	Cho biết số lượng chỗ làm việc theo mỗi phòng ban. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc
SELECT d.depNum, d.depName, COUNT(dl.locNum) AS LocationCount
FROM tblDepartment d
JOIN tblDepLocation dl ON d.depNum = dl.depNum
GROUP BY d.depNum, d.depName;

--34.	Cho biết phòng ban nào có nhiều chỗ làm việc nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc
SELECT TOP 1 d.depNum, d.depName, COUNT(dl.locNum) AS LocationCount
FROM tblDepartment d
JOIN tblDepLocation dl ON d.depNum = dl.depNum
GROUP BY d.depNum, d.depName
ORDER BY locationCount DESC;

--35.	Cho biết phòng ban nào có it chỗ làm việc nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc
SELECT TOP 1 d.depNum, d.depName, COUNT(dl.locNum) AS locationCount
FROM tblDepartment d
JOIN tblDepLocation dl ON d.depNum = dl.depNum
GROUP BY d.depNum, d.depName
ORDER BY locationCount ASC;

--36.	Cho biết địa điểm nào có nhiều phòng ban làm việc nhất. Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban
SELECT TOP 1 l.locName, COUNT(DISTINCT dl.depNum) AS departmentCount
FROM tblLocation l
JOIN tblDepLocation dl ON l.locNum = dl.locNum
GROUP BY l.locName
ORDER BY departmentCount DESC;

--37.	Cho biết địa điểm nào có ít phòng ban làm việc nhất. Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban
SELECT TOP 1 l.locName, COUNT(DISTINCT dl.depNum) AS departmentCount
FROM tblLocation l
JOIN tblDepLocation dl ON l.locNum = dl.locNum
GROUP BY l.locName
ORDER BY departmentCount ASC;

--38.	Cho biết nhân viên nào có nhiều người phụ thuộc nhất. Thông tin yêu cầu: mã số, họ tên nhân viên, số lượng người phụ thuộc
SELECT TOP 1 e.empSSN, e.empName, COUNT(e.depNum) AS DependentCount
FROM tblEmployee e
JOIN tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY e.empSSN, e.empName
ORDER BY dependentCount ASC;

--39.	Cho biết nhân viên nào có ít người phụ thuộc nhất. Thông tin yêu cầu: mã số, họ tên nhân viên, số lượng người phụ thuộc
SELECT e.empSSN, e.empName, COUNT(e.depNum) AS dependentCount
FROM tblEmployee e
JOIN tblDependent d ON e.empSSN = d.empSSN
GROUP BY e.empSSN, e.empName
ORDER BY dependentCount DESC;

--40.	Cho biết nhân viên nào không có người phụ thuộc. Thông tin yêu cầu: mã số nhân viên, họ tên nhân viên, tên phòng ban của nhân viên
SELECT e.empSSN, e.empName, d.depName
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
WHERE dep.empSSN IS NULL;

--41.	Cho biết phòng ban nào không có người phụ thuộc. Thông tin yêu cầu: mã số phòng ban, tên phòng ban
SELECT DISTINCT d.depNum, d.depName
FROM tblDepartment d
where depNum != ALL (
	SELECT DISTINCT d.depNum
	FROM tblDepartment d
	inner JOIN tblEmployee e ON d.depNum = e.depNum
	inner JOIN tblDependent dep ON e.empSSN = dep.empSSN
)

--42.	Cho biết những nhân viên nào chưa hề tham gia vào bất kỳ dự án nào. Thông tin yêu cầu: mã số, tên nhân viên, tên phòng ban của nhân viên
SELECT e.empSSN, e.empName, d.depName
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
LEFT JOIN tblWorksOn w ON e.empSSN = w.empSSN
WHERE w.proNum IS NULL;

--43.	Cho biết phòng ban không có nhân viên nào tham gia (bất kỳ) dự án. Thông tin yêu cầu: mã số phòng ban, tên phòng ban
SELECT DISTINCT d.depNum, d.depName
FROM tblDepartment d
where depNum != ALL (
	SELECT DISTINCT d.depNum
	FROM tblDepartment d
	inner JOIN tblEmployee e ON d.depNum = e.depNum
	inner JOIN tblWorksOn w ON e.empSSN = w.empSSN
)

--44.	Cho biết phòng ban không có nhân viên nào tham gia vào dự án có tên là ProjectA. Thông tin yêu cầu: mã số phòng ban, tên phòng ban
SELECT depNum, depName
From tblDepartment
Where depNum != ALL(
	SELECT DISTINCT d.depNum
	FROM tblDepartment d
	inner JOIN tblEmployee e ON d.depNum = e.depNum
	inner JOIN tblWorksOn w ON e.empSSN = w.empSSN
	inner JOIN tblProject p ON w.proNum = p.proNum AND p.proName = 'ProjectA'
)


--45.	Cho biết số lượng dự án được quản lý theo mỗi phòng ban. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng dự án
SELECT d.depNum, d.depName, COUNT(DISTINCT p.proNum) AS projectCount
FROM tblDepartment d
LEFT JOIN tblProject p ON d.depNum = p.depNum
GROUP BY d.depNum, d.depName;

--46.	Cho biết phòng ban nào quản lý it dự án nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng dự án
SELECT TOP 1 d.depNum, d.depName, COUNT(DISTINCT p.proNum) AS projectCount
FROM tblDepartment d
LEFT JOIN tblProject p ON d.depNum = p.depNum
GROUP BY d.depNum, d.depName
ORDER BY projectCount ASC;

--47.	Cho biết phòng ban nào quản lý nhiều dự án nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng dự án
SELECT TOP 1 d.depNum, d.depName, COUNT(DISTINCT p.proNum) AS projectCount
FROM tblDepartment d
LEFT JOIN tblProject p ON d.depNum = p.depNum
GROUP BY d.depNum, d.depName
ORDER BY projectCount DESC;

--48.	Cho biết những phòng ban nào có nhiểu hơn 5 nhân viên đang quản lý dự án gì. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng nhân viên của phòng ban, tên dự án quản lý


SELECT d.depNum, d.depName, COUNT(DISTINCT e.empSSN) AS employeeCount, p.proName
FROM tblDepartment d
JOIN tblEmployee e ON d.depNum = e.depNum
JOIN tblWorksOn w ON e.empSSN = w.empSSN
JOIN tblProject p ON w.proNum = p.proNum
GROUP BY d.depNum, d.depName, p.proName
Having d.depNum = ANY (
	SELECT d.depNum
	FROM tblDepartment d
	JOIN tblEmployee e ON d.depNum = e.depNum
	GROUP BY d.depNum 
	HAVING COUNT(DISTINCT e.empSSN) >= 5
)


--49.	Cho biết những nhân viên thuộc phòng có tên là Phòng nghiên cứu, và không có người phụ thuộc. Thông tin yêu cầu: mã nhân viên,họ tên nhân viên
SELECT e.empSSN, e.empName, d.depName
FROM tblEmployee e
JOIN tblDepartment d ON e.depNum = d.depNum
LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
WHERE d.depName = N'Phòng Nghiên cứu và phát triển' AND dep.empSSN IS NULL;

--50.	Cho biết tổng số giờ làm của các nhân viên, mà các nhân viên này không có người phụ thuộc. Thông tin yêu cầu: mã nhân viên,họ tên nhân viên, tổng số giờ làm
SELECT e.empSSN, e.empName, SUM(w.workHours) AS totalWorkHours
FROM tblEmployee e
LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
LEFT JOIN tblWorksOn w ON e.empSSN = w.empSSN
WHERE dep.empSSN IS NULL
GROUP BY e.empSSN, e.empName;

--51.	Cho biết tổng số giờ làm của các nhân viên, mà các nhân viên này có nhiều hơn 3 người phụ thuộc. Thông tin yêu cầu: mã nhân viên,họ tên nhân viên, số lượng người phụ thuộc, tổng số giờ làm
SELECT e.empSSN, e.empName, COUNT(e.depNum) AS dependentCount, SUM(w.workHours) AS totalWorkHours
FROM tblEmployee e
JOIN tblDependent dep ON e.empSSN = dep.empSSN
left JOIN tblWorksOn w ON e.empSSN = w.empSSN
GROUP BY e.empSSN, e.empName
HAVING COUNT(e.depNum) > 3;

--52.	Cho biết tổng số giờ làm việc của các nhân viên hiện đang dưới quyền giám sát (bị quản lý bởi) của nhân viên Mai Duy An. Thông tin yêu cầu: mã nhân viên, họ tên nhân viên, tổng số giờ làm
SELECT e.empSSN, e.empName, SUM(w.workHours) AS totalWorkHours
FROM tblEmployee e
JOIN tblEmployee s ON e.supervisorSSN = s.empSSN
JOIN tblWorksOn w ON e.empSSN = w.empSSN
WHERE s.empName = 'Mai Duy An'
GROUP BY e.empSSN, e.empName;


