package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.EmployeeReg;
import com.utils.DBConnection;



public class EmployeRegDAO extends DBConnection {

	public int insert(EmployeeReg employeeReg) {
		Connection conn = null;
		PreparedStatement ps = null;
//		boolean isInserted = false;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			if (conn != null) {
				String sql = "INSERT INTO EMPLOYEE (NAME, PASSWORD, EMAIL, COUNTRY) VALUES (?, ?, ?, ?)";
				ps = conn.prepareStatement(sql);

				ps.setString(1, employeeReg.getName());
				ps.setString(2, employeeReg.getPassword());
				ps.setString(3, employeeReg.getEmail());
				ps.setString(4, employeeReg.getCountry());

				count = ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}

//	Statement stmt;
//	PreparedStatement ps;
//	ResultSet rs;
//	Connection dbcon;
//	int count = 0;
//
//	public EmployeRegDAO() {
//		dbcon = DBConnection.getConnection();
//	}
//
//	// create operation//
//
//	public int addEmp(EmployeeReg e) {
//		int count = 0;
//		try
//
//		{
//			ps = dbcon.prepareStatement("INSERT INTO EMPLOYEE_LIST(NAME,PASSWORD,EMAIL,COUNTRY)" + "VALUES +(?,?,?,?)");
//
//			ps.setString(1, e.getName());
//			ps.setString(2, e.getPassword());
//			ps.setString(3, e.getEmail());
//			ps.setString(4, e.getCountry());
//
//			count = ps.executeUpdate();
//
//		}
//
//		catch (Exception e1) {
//
//		}
//		return count;
//
//	}
}
