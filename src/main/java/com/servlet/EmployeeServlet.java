package com.servlet;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Collectors;

import com.dao.EmployeeDao;
import com.model.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmployeeServlet
 */
@WebServlet("/employee")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private EmployeeDao employeeDao = new EmployeeDao();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		String action = request.getParameter("action");
		
		if(action==null) {
			System.out.println("*****%%%%%%%$##########################HOME");
			List<Employee> employeeList = getEmployees();
			request.setAttribute("employeeList", employeeList);
			request.getRequestDispatcher("EmployeeHome.jsp").forward(request, response);
			}
		else {
			switch (action) {
		    case "newForm": {
		    	System.out.println("new form ************************");
		        request.setAttribute("employee", null);
		        request.getRequestDispatcher("EmployeeForm.jsp").forward(request, response);
		        break; // Exit the switch block
		    }
		    case "save": {
		    	System.out.println("save form ************************");
		        String name = request.getParameter("name");
		        String job = request.getParameter("job");
		        
		        System.out.println(request.getParameter("sal") + "       " + request.getParameter("deptno"));
		        int sal = Integer.parseInt(request.getParameter("sal"));
		        int deptno = Integer.parseInt(request.getParameter("deptno"));
		        
		        Employee employee = new Employee(name, sal, job, deptno);
		        employeeDao.saveEmployee(employee);
		        
		        List<Employee> employeeList = getEmployees();
		        request.setAttribute("employeeList", employeeList);
		        request.getRequestDispatcher("EmployeeHome.jsp").forward(request, response);
		        break; // Exit the switch block
		    }
		    case "updateForm": {
		    	long empNo = Long.parseLong(request.getParameter("empno")) ;
		    	Employee employee = employeeDao.getEmployeeByEmpNo(empNo);
			    request.setAttribute("employee", employee);
			    request.getRequestDispatcher("EmployeeForm.jsp").forward(request, response);
		        break; // Exit the switch block
		    }
		    case "update": {
		    	System.out.println("update ********************************************************");
		    	long empNo = Long.parseLong(request.getParameter("empno")) ;
		    	String name = request.getParameter("name");
		    	String job = request.getParameter("job");
		    	int sal = Integer.parseInt(request.getParameter("sal"));
		    	int deptno = Integer.parseInt(request.getParameter("deptno"));
		    	
		    	Employee employee = new Employee(empNo,name, sal, job, deptno);
		    	employeeDao.updateEmployee(employee);
		    	
		    	List<Employee> employeeList = getEmployees();
		    	request.setAttribute("employeeList", employeeList);
		    	request.getRequestDispatcher("EmployeeHome.jsp").forward(request, response);
		    	break; // Exit the switch block
		    }
		    case "delete": {
		    	long empNo = Long.parseLong(request.getParameter("empno")) ;
		    	System.out.println("delete ********************************************************"+empNo);
		        employeeDao.deleteEmployeeById(empNo);
		        List<Employee> employeeList = getEmployees();
		    	request.setAttribute("employeeList", employeeList);
		    	request.getRequestDispatcher("EmployeeHome.jsp").forward(request, response);
		        break; // Exit the switch block
		    }
		    ///coding challenge 
		    case "a": {
		    	System.out.println("coding ******************************************************** A");
		    	List<Employee> employeeList = employeeDao.getEmployeesStartingWithA();
		    	request.setAttribute("employeeList", employeeList);
		    	request.getRequestDispatcher("EmployeeHome.jsp").forward(request, response);
		    	break; 
		    }
		    case "b": {
		    	System.out.println("coding ******************************************************** B");
		    	List<Employee> employeeList = employeeDao.getEmployeesWithSalaryBetween5kAnd7k();
		    	request.setAttribute("employeeList", employeeList);
		    	request.getRequestDispatcher("EmployeeHome.jsp").forward(request, response);
		    	break; // Exit the switch block
		    }
		    case "c": {
		    	System.out.println("coding ******************************************************** C");
		    	
		    	List<Employee> employeeList = getEmployees();
		    	request.setAttribute("employeeList", employeeList);
		    	request.setAttribute("min", employeeDao.getSecondMinimumSalary());
		    	request.setAttribute("max", employeeDao.getSecondMaximumSalary());
		    	request.setAttribute("taskc", employeeDao.getSecondMaximumSalary());
		    	request.getRequestDispatcher("EmployeeHome.jsp").forward(request, response);
		    	break; // Exit the switch block
		    }
		    case "d": {
		    	System.out.println("coding ******************************************************** d");
		    	
		    	List<Employee> employeeList = employeeDao.getEmployeesWithDuplicateSalaries();
		    	String ids = employeeList.stream()
                        .map(employee -> String.valueOf(employee.getEmpno())) // Convert employee number to String
                        .collect(Collectors.joining(","));
		    	request.setAttribute("employeeList", employeeList);
		    	request.setAttribute("ids", ids);
		    	request.setAttribute("taskd", "taskd");
		    	request.getRequestDispatcher("EmployeeHome.jsp").forward(request, response);
		    	break; // Exit the switch block
		    }
		    case "d-update": {
		    	System.out.println("coding ******************************************************** d-update");
		    	String ids = request.getParameter("ids") ;
//		    	int sal = Integer.parseInt(request.getParameter("sal"));
		    	employeeDao.updateAllEmployeeSalariesTo5k(ids);
		    	List<Employee> employeeList = employeeDao.getEmployeesWithDuplicateSalaries();
		    	request.setAttribute("employeeList", employeeList);
		    	request.setAttribute("task", "c");
		    	request.getRequestDispatcher("EmployeeHome.jsp").forward(request, response);
		    	break; 
		    }
		    
		    default: {
		        // Handle unknown actions
		        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action: " + action);
		        break;
		    }
		}
		}

				
		
		}



	private List<Employee> getEmployees() {
		List<Employee> employeeList = employeeDao.getEmployees();
//			System.out.println("Emplloyuee List size:"+employeeList.size());
		for (Employee emp : employeeList) {
		    System.out.println("Employee ID: " + emp.getEmpno() + ", Name: " + emp.getEname());
		}		
		System.out.println();
		return employeeList;
	}
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
