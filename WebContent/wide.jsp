<%@page import="java.util.Map"
%><%@page 	import="java.sql.Connection"
%><%@page 	import="com.wide.db.DB"
%>

<!DOCTYPE html>

<html>

	<head>
		<title>Wide v1.0</title>
		<script type="text/javascript" src="js/jquery_1.8.3.js"></script>
		<script type="text/javascript" src="js/wide.js"></script>
		<link rel="stylesheet" type="text/css" href="css/wide.css">
	</head>
	
	<body>
	
		<%
			Connection conn = null; 
			conn = DB.getConn(conn);
			String friends = "",
					groups = "";
			Map<String, String>	myNick = null;
			if(conn != null){
				myNick = DB.getMyNick(conn, 1);
				friends = DB.getFriends(conn, 1);
				groups = DB.getGroups(conn, 1);
			}
			else{
				out.println("A Servererror! Sorry!");
			}
		%>
	
		<div id="header">
			<table>
				<tr>
					<td id="title">Wide</td>
					<td id="myNick"><%=myNick.get("nick").toString()%></td>
				</tr>
			</table>
		</div>
	
		<div id="contentWrapper">
			
			<div id="contacts">
				<div>
					<select id="groupSelectbox">
						<option value="all">
							All 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</option>	
						<%=groups%>
					</select>
				</div>
				<%=friends%>
			</div>
			
			<div id="chatWrapper">
		
				<ul>
					<li>Tab1
						<div class="chatScreen">
						</div>
					</li>
				</ul>
				
				<div class="chatTabFooter">
					<input id="messageInput" type="text"/>
					<button id="sendBtn">Send</button>
				</div>
				
			</div>
			
		</div>
	
	</body>

</html>