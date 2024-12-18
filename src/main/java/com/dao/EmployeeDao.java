package com.dao;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.model.Employee;
import com.utils.HibernateUtil;

public class EmployeeDao {
	
	public List<Employee> getEmployees() {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			return session.createQuery("FROM Employee", Employee.class).list();
		}
	}

	public Employee getEmployeeByEmpNo(long empNo) {
		try (Session session = HibernateUtil.getSessionFactory().openSession()) {
			 return session.createQuery("FROM Employee WHERE empno = :empNo", Employee.class)
                     .setParameter("empNo", empNo)
                     .uniqueResult();
		}
	}
	
	public boolean deleteEmployeeById(long empId) {
	    Transaction transaction = null;
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        // Begin a transaction
	        transaction = session.beginTransaction();

	        // Retrieve the employee object to delete
	        Employee employee = session.get(Employee.class, empId);
	        if (employee != null) {
	            // Delete the employee
	            session.delete(employee);

	            // Commit the transaction
	            transaction.commit();
	            return true; // Deletion successful
	        } else {
	            System.out.println("Employee with ID " + empId + " not found.");
	            return false; // Employee not found
	        }
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback(); // Rollback the transaction in case of an exception
	        }
	        e.printStackTrace();
	        return false; // Deletion failed
	    }
	}

	
	public boolean saveEmployee(Employee employee) {
	    Transaction transaction = null;
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        // Begin a transaction
	        transaction = session.beginTransaction();

	        // Save the employee object
	        session.save(employee);

	        // Commit the transaction
	        transaction.commit();

	        return true; // Save operation was successful
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback(); // Rollback in case of an exception
	        }
	        e.printStackTrace();
	        return false; // Save operation failed
	    }
	}
	
	public boolean updateEmployee(Employee updatedEmployee) {
	    Transaction transaction = null;
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        // Begin a transaction
	        transaction = session.beginTransaction();

	        // Update the employee object
	        session.update(updatedEmployee);

	        // Commit the transaction
	        transaction.commit();

	        return true; // Update operation was successful
	    } catch (Exception e) {
	        if (transaction != null) {
	            transaction.rollback(); // Rollback in case of an exception
	        }
	        e.printStackTrace();
	        return false; // Update operation failed
	    }
	}
	
	public List<Employee> getEmployeesBySalary(int salary) {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        // Use a parameterized query to filter employees by salary
	        return session.createQuery("FROM Employee WHERE sal = :salary", Employee.class)
	                      .setParameter("salary", salary)
	                      .list();
	    } catch (Exception e) {
	        e.printStackTrace();
	        return Collections.emptyList(); // Return an empty list if an exception occurs
	    }
	}
	
	public List<Employee> getEmployeesStartingWithA() {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        String hql = "FROM Employee e WHERE LOWER(e.ename) LIKE :namePattern";
	        return session.createQuery(hql, Employee.class)
	                      .setParameter("namePattern", "a%")
	                      .list();
	    }
	}
	
	public List<Employee> getEmployeesWithSalaryBetween5kAnd7k() {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        String hql = "FROM Employee e WHERE e.sal BETWEEN :minSalary AND :maxSalary";
	        return session.createQuery(hql, Employee.class)
	                      .setParameter("minSalary", 5000)
	                      .setParameter("maxSalary", 7000)
	                      .list();
	    }
	}
	
	public List<Employee> getEmployeesWithDuplicateSalaries() {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        String hql = "FROM Employee e WHERE e.sal IN (SELECT e2.sal FROM Employee e2 GROUP BY e2.sal HAVING COUNT(e2.sal) > 1)";
	        return session.createQuery(hql, Employee.class).list();
	    }
	}
	
	public void updateAllEmployeeSalariesTo5k(String ids) {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        session.beginTransaction();
	        
	        List<Long> empnos = Arrays.stream(ids.split(","))
                    .map(Long::parseLong)
                    .collect(Collectors.toList());
	        
	        String hql = "UPDATE Employee e SET e.sal = :newSalary WHERE e.empno IN (:empnos)";
	        int updatedRows = session.createQuery(hql)
	                                 .setParameter("newSalary", 5000)
	                                 .setParameter("empnos", empnos)
	                                 .executeUpdate();
	        session.getTransaction().commit();
	        System.out.println("Updated rows: " + updatedRows);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public Integer getSecondMinimumSalary() {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        String hql = "SELECT DISTINCT e.sal FROM Employee e ORDER BY e.sal ASC";
	        return session.createQuery(hql, Integer.class)
	                      .setFirstResult(1) // Skip the first (minimum) salary
	                      .setMaxResults(1)  // Fetch the second minimum salary
	                      .uniqueResult();
	    }
	}
	
	public Integer getSecondMaximumSalary() {
	    try (Session session = HibernateUtil.getSessionFactory().openSession()) {
	        String hql = "SELECT DISTINCT e.sal FROM Employee e ORDER BY e.sal DESC";
	        return session.createQuery(hql, Integer.class)
	                      .setFirstResult(1) // Skip the first (maximum) salary
	                      .setMaxResults(1)  // Fetch the second maximum salary
	                      .uniqueResult();
	    }
	}









	
}
