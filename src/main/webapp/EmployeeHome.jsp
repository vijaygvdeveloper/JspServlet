<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Employee Management Application</title>
</head>
<body>
	<center>
		<h1>Employee Management</h1>
        <h2>
        	<a href="employee?action=newForm">Add New Employee</a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="employee">List All Employees</a>
        	
        </h2>
        
<h2>Coding Challenge 2.0</h2>

<ul>
  <li><a href="employee?action=a">Emplyee Name Starts with 'A'</a></li>
  <li><a href="employee?action=b">Salary between 5k to 7k</a></li>
  <li><a href="employee?action=c">Second Minimum Salary and Max Salary</a></li>
  <li><a href="employee?action=d">Retrive the same salary and update to 5K</a></li>
</ul>
	</center>
    <div align="center">
        <%-- <table border="1" cellpadding="5">
            <caption><h2>List of </h2></caption>
            <tr>
                <th>Emp No</th>
                <th>Emp Name</th>
                <th>Salary</th>
                <th>Job</th>
                <th>Dept No</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="emp" items="${employeeList}">
                <tr>
                    <td><c:out value="${emp.empno}" /></td>
                    <td><c:out value="${emp.ename}" /></td>
                    <td><c:out value="${emp.sal}" /></td>
                    <td><c:out value="${emp.job}" /></td>
                    <td><c:out value="${emp.deptno}" /></td>
                    <td>
                    	<a href="edit?id=<c:out value='${emp.empno}' />">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="delete?id=<c:out value='${emp.empno}' />">Delete</a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table> --%>
        <c:choose>
        <c:when test="${not empty employeeList}">
           <table border="1" cellpadding="5">
            <caption><h2> Coding Challenge 1.0</h2></caption>
            <tr>
                <th>Emp No</th>
                <th>Emp Name</th>
                <th>Salary</th>
                <th>Job</th>
                <th>Dept No</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="emp" items="${employeeList}">
                <tr>
                    <td><c:out value="${emp.empno}" /></td>
                    <td><c:out value="${emp.ename}" /></td>
                    <td><c:out value="${emp.sal}" /></td>
                    <td><c:out value="${emp.job}" /></td>
                    <td><c:out value="${emp.deptno}" /></td>
                    <td>
                    	<a href="employee?action=updateForm&empno=<c:out value='${emp.empno}' />">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="employee?action=delete&empno=<c:out value='${emp.empno}' />">Delete</a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
        </c:when>
        <c:otherwise>
            <p style="text-align: center; color: red;">No employees found.</p>
        </c:otherwise>
    </c:choose>
    </div>
    <div>
     <p style="text-align: center;" >
            <c:choose>
                <c:when test="${not empty taskc}">
                    Second Minimum Salary: <strong>${min}</strong> 
                    <br>
                    Second Maximum Salary: <strong>${max}</strong> 
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>
        </p>
    </div>	
    <div>
    <c:if test="${not empty taskd}">
    <form style="text-align: center;"  action="employee?action=d-update" method="post"> 
    <%-- <p><c:out value='${ids}' /></p> --%>
     <input type="hidden" name="ids" value="<c:out value='${ids}' />" />
  <!--    <tr>
                <th>Employee Salary: </th>
                <td>
                	<input type="number" name="sal"  />
                </td>
            </tr>  -->
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Update Salary To 5k" />
            	</td>
            </tr>
    </form>
    </c:if>
    </div>	
</body>
</html>