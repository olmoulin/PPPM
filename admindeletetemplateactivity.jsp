
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
  <head>
    <title>Untitled Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <style type="text/css"> 
      body { color: black; font-family: arial; font-size: 11px}
      h1 { color: black; font-family: arial; font-size: 16px}
    </style> 
  </head>

    <%-- PPPM.ORG, the OpenSource PPM (Portfolio, Project and Program management) system --%>
    <%-- Copyright (C) 2012  Olivier Moulin --%>

    <%-- This program is free software: you can redistribute it and/or modify --%>
    <%-- it under the terms of the GNU General Public License as published by --%>
    <%-- the Free Software Foundation, version 3 of the License. --%>

    <%-- This program is distributed in the hope that it will be useful, --%>
    <%-- but WITHOUT ANY WARRANTY; without even the implied warranty of --%>
    <%-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the --%>
    <%-- GNU General Public License for more details. --%>

    <%-- You should have received a copy of the GNU General Public License --%>
    <%-- along with this program.  If not, see http://www.gnu.org/licenses/. --%>


  <%@ page import = "java.sql.*" %>
  <%@ page import = "java.util.*" %>
  <%@ page import = "javax.sql.*" %>
  <%@ page import = "javax.naming.*" %>
  <%@ page import = "javax.servlet.*" %>
  <%@ page import = "javax.servlet.http.*" %>

  <body background="images/fond.gif">
    <%
      // session attributes
      String Userlogin = (String)session.getAttribute("LOGIN");


      if (Userlogin==null) {
        out.print("<script language=\"JavaScript\">");
        out.print("top.location='index.jsp?TIMEOUT=TRUE';");
        out.print("</script>");
      } else {
        String POOLNAME=(String)session.getAttribute("POOLNAME");

        // database connection
        Context initCtx = new InitialContext();
        DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/"+POOLNAME);
        Connection Conn = ds.getConnection();
   
        // JSP parameters
        String act = request.getParameter("TODO");
        String TEMPLATE = request.getParameter("TEMPLATE");
        String ORD = request.getParameter("ORD");
        String ACTORD = request.getParameter("ACTORD");
      	out.print("<center><strong><h1>Delete phase template</h1></strong></center><hr>");
        out.print("<form name=\"formFILTER\" method=\"post\" action=\"admintemplateactivity.jsp?TODO=DELETE&TEMPLATE="+TEMPLATE+"&ORD="+ORD+"&ACTORD="+ACTORD+"\" target=\"appliFrame\">");
        out.print("<table>");
        out.print("<tr><td>Template : </td><td>"+TEMPLATE+"</td></tr>");
        Statement STR01 = Conn.createStatement();
        String QR01 = "SELECT * FROM  PHASE_TEMPLATE_ACTIVITY WHERE TEMPLATE='"+TEMPLATE+"' AND ORD='"+ORD+"' AND ACTORD="+ACTORD;
        ResultSet R01 = STR01.executeQuery(QR01);
        if (R01.next()) {
          out.print("<tr><td>Activity : </td><td>"+R01.getString("NAME")+"</td></tr>");
        }
        STR01.close();
        out.print("<tr><td><H1>Are you sure that you want to delete this phase template activity ??</H1></td><td>&nbsp;</td></tr>");
        out.print("<tr><td>&nbsp;</td><td><input type=\"submit\" name=\"Save\" value=\"Delete\">");
        out.print("<input type=button onClick=\"location.href='admintemplateactivity.jsp?TODO=NONE'\" value='Cancel'></td></tr>");
        out.print("</table>");
        out.print("</form>");
        Conn.close();
      }

    %>
  </body>
</html>
