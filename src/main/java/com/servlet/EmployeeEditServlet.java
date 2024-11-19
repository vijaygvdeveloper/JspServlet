package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.EmployeDAO;
import com.pojo.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmployeeEditServlet
 */
public class EmployeeEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Employee e;
    EmployeDAO dao;
    int count=0;
    RequestDispatcher dispatcher;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String country=request.getParameter("country");
		
		
		System.out.println(name);
		System.out.println(password);
		System.out.println(email);
		System.out.println(country); 
		
		
		/* Store details inot model class */
			
		e=new Employee();
		e.setName(name);
		e.setPassword(password);
		e.setEmail(email);
		e.setCountry(country);
		
		dao=new EmployeDAO();
		count=dao.insert(e);
		
		
		if(count!=0)
		{
			out.println("<h1 style='color:green'>"+ "Record Inserted Successfully...</h1>");
			dispatcher=request.getRequestDispatcher("Employee.jsp");
			dispatcher.include(request, response);
		}
		else
			
		{
			out.println("<h1 style='color:green'>"+ "Record Insertion failed...</h1>");
			dispatcher=request.getRequestDispatcher("Employee.jsp");
			dispatcher.include(request, response);
		}
		
	}

}
