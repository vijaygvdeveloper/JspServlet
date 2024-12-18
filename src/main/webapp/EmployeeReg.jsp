<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration</title>
</head>
<body>
<form action=EmployeeRegServlet method="post">
	<table> 
		<tr><td>Name:</td><td><input type="text" name="name"/></td></tr>  
		<tr><td>Password:</td><td>  
		<input type="password" name="password"/></td></tr>  
		<tr><td>Email:</td><td><input type="email" name="email"/></td></tr>  
		<tr><td>Country:</td><td>  
		<select name="country" style="width:155px">  
		<option>India</option>  
		<option>Paris</option>  
		<option>America</option>  
		<option>London</option>  
		<option>Other</option>  
</select>  
</td></tr>  
<tr><td colspan="2"><input type="submit" value="Edit & Save"/></td></tr> 
	</table>
</form>
</body>
</html>