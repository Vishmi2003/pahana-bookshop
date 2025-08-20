<%@ page import="java.sql.*" %>
<%@ page import="com.code.DBConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = DBConnection.getInstance().getConnection();
    PreparedStatement ps = conn.prepareStatement("DELETE FROM staff WHERE ID=?");
    ps.setInt(1, id);
    ps.executeUpdate();
    response.sendRedirect("manageStaff.jsp");
%>
