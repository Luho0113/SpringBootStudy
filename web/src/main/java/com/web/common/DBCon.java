package com.web.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
	//DB 연결 전용 메소드를 생성함
	//예외 처리가 필요함 (jsp는 자체적으로 예외처리가 되지만 자바파일은 안됨)
	
	public static Connection getCon() {
		
		Connection con = null; //커넥션 준비
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc 준비 ex)유심장착
			
			String url = "jdbc:mysql://localhost/nothing"; //ex) 전화번호
			String id = "root";
			String pwd = "1234";
			
			con = DriverManager.getConnection(url, id, pwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 

		return con;
	}
}
