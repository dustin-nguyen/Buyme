<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
		try {
			int itemID = Integer.parseInt(request.getParameter("itemID"));
			String seller = request.getParameter("seller");
			
			String delete = "DELETE FROM Product WHERE itemID=? AND seller=?";
			ps1 = conn.prepareStatement(delete);
			ps1.setInt(1, itemID);
			ps1.setString(2, seller);
			
			int insertResult = 0;
			insertResult = ps1.executeUpdate();
			if (insertResult < 1) {
				response.sendRedirect("error.jsp"); // This should never happen	
			} else {
				// Auction was successfully deleted %>
				<div class="content center">
					<h1>Auction was successfully deleted.</h1>
				</div>
			}
		} catch(Exception e) {
			out.print("<p>Error connecting to MYSQL server.</p>");
		    e.printStackTrace();
		} finally {
			try { ps1.close(); } catch (Exception e) {}
	        try { conn.close(); } catch (Exception e) {}
		}
%>