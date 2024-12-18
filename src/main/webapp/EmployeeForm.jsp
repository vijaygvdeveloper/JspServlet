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
        	<a href="new">Add New Employee</a>
        	&nbsp;&nbsp;&nbsp;
        	<a href="list">List All Employees</a>
        	
        </h2>
	</center>
    <div align="center">
		<c:if test="${employee != null}">
			<form action="employee?action=update" method="post">
        </c:if>
        <c:if test="${employee == null}">
			<form action="employee?action=save" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${employee != null}">
            			Edit Employee
            		</c:if>
            		<c:if test="${employee == null}">
            			Add New Employee
            		</c:if>
            	</h2>
            </caption>
        		<c:if test="${employee != null}">
        			<input type="hidden" name="empno" value="<c:out value='${employee.empno}' />" />
        		</c:if>            
            <tr>
                <th>Employee Name: </th>
                <td>
                	<input type="text" name="name" 
                			value="<c:out value='${employee.ename}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Employee Salary: </th>
                <td>
                	<input type="number" name="sal"  size="45"
                			value="<c:out value='${employee.sal}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Job: </th>
                <td>
                	<input type="text"  name="job"
                			value="<c:out value='${employee.job}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>DeptNo: </th>
                <td>
                	<input type="number"  name="deptno" size="15"
                			value="<c:out value='${employee.deptno}' />"
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" />
            	</td>
            </tr>
        </table>
        </form>
    </div>	
</body>
</html>
