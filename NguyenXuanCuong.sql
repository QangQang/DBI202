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