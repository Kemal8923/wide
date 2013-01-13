package com.wide.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class DB {

	public static Connection getConn(Connection conn){
		String user="postgres",
				pw="testxy23";
		try{
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", user, pw);
			System.out.println("Mit Datenbank verbunden...");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		return conn;
	}
	
	public static boolean closeConn(Connection conn){
		try{
			conn.close();
			System.out.println("Connection geschlossen...");
			return true;
		}
		catch(SQLException e){
			System.out.println("FEHLER: Connection nicht geschlossen..."); 	
			e.printStackTrace();
			return false;
		}
	}
	
	public static Map<String, String> getMyNick(Connection conn, int myId){
		String sql = 
				"SELECT u.uid, u.name "+
				"FROM users as u "+
				"WHERE u.uid="+myId;
		Map<String, String> myInfos = null;
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			myInfos = new HashMap<String, String>();
			while(rs.next()){
				myInfos.put("id", rs.getString(1));
				myInfos.put("nick", rs.getString(2));
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return myInfos;
	}
	
	public static String getFriends(Connection conn, int myId){
		String query = 
				"SELECT u.uid, u.name " +
				"FROM users as u, friends as f " +
				"WHERE f.uid1="+myId+" and u.uid=f.uid2";

		StringBuffer sb = new StringBuffer();
		
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
				sb.append(
						"<div class='friend' id='"+rs.getString(1)+"'>"+
								"<div style='background-color: gray; width: 50px; height: 50px; float: left; margin: 5px'>"+
								"</div>"+
								"<div style='line-height:50px; vertical-align: center'>"+
									rs.getString(2)+
								"</div>"+
								"<div style='clear: both'></div>"+
						"</div>"
				);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return sb.toString();
	}
	
	public static String getGroups(Connection conn, int myId){
		String sql = 
				"select g.gid, g.gname "+
				"from groups as g "+
				"where g.ownerid="+myId;
		StringBuffer sb = new StringBuffer();
		try{
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				sb.append(
						"<option value='"+rs.getString(1)+"' >"+rs.getString(2)+"</option>"
				);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return sb.toString();
	}
	
}
