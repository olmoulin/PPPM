
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css"> 
body { color: black; font-family: arial; font-size: 12px}
h1 { color: black; font-family: arial; font-size: 18px}

 </style> 

<SCRIPT LANGUAGE="JavaScript" SRC="javascript/CalendarPopup.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="javascript/PopupWindow.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="javascript/date.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" SRC="javascript/AnchorPosition.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
var cal = new CalendarPopup();
</SCRIPT>

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



  <%@ page import = "java.sql.*" %>
  <%@ page import = "java.util.*" %>
  <%@ page import = "java.util.Date" %>
  <%@ page import = "java.util.Calendar" %>
  <%@ page import = "java.text.SimpleDateFormat" %>
  <%@ page import = "java.util.GregorianCalendar" %>
  <%@ page import = "java.text.DateFormat" %>
  <%@ page import = "javax.sql.*" %>
  <%@ page import = "javax.naming.*" %>
  <%@ page import = "javax.servlet.*" %>
  <%@ page import = "javax.servlet.http.*" %>
<%@ page import="fr.pppm.*" %>

<body background="images/comp023.gif">

<%String Userlogin = (String)session.getAttribute("LOGIN");
  String POOLNAME=(String)session.getAttribute("POOLNAME");
  Context initCtx = new InitialContext();
  DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/"+POOLNAME);
  Connection Conn = ds.getConnection();
  String act = request.getParameter("TODO");
  String ID = request.getParameter("ID");
  PPPMTools pt = new PPPMTools();

  out.print("<center><strong><h1>Operating System</h1></strong></center><hr>");

  String NAME = "";
  String VENDORID = "NONE";
  int ESDAY=0;
  int ESMONTH=0;
  int ESYEAR=0;
  String VERSION = "";

  if (act.equals("ADD")) {
    out.print("<form name=\"formFILTER\" method=\"post\" action=\"os.jsp?TODO=ADD&RO=NO\" target=\"appliFrame\">");
  } else {
    out.print("<form name=\"formFILTER\" method=\"post\" action=\"os.jsp?TODO=MOD&ID="+ID+"&RO=NO\" target=\"appliFrame\">");
  }

  if (!act.equals("ADD")) {
    Statement st10 = Conn.createStatement();
    String q10 = "SELECT * FROM CMDB_OS WHERE ID='"+ID+"'";
    ResultSet r10 = st10.executeQuery(q10);
    if (r10.next()) {
      NAME=r10.getString("NAME");
      ESDAY=r10.getInt("ESDAY");
      ESMONTH=r10.getInt("ESMONTH");
      ESYEAR=r10.getInt("ESYEAR");
      VENDORID=r10.getString("VENDORID");
      VERSION=r10.getString("VERSION");
    }
    st10.close();
  }

  out.print("<table>");


  out.print("<tr><td>Name: </td><td><input name=\"NAME\" type=\"text\" size=\"50\" value=\""+NAME+"\"></td></tr>");

  out.print("<tr><td>Version: </td><td><input name=\"VERSION\" type=\"text\" size=\"50\" value=\""+VERSION+"\"></td></tr>");
  
  out.print("<tr><td>Vendor / Editor : </td><td><select name=\"VENDORID\">");
  out.print("<option");
  if (VENDORID.equals("NONE")) {
    out.print(" selected ");
  }
  out.print(">NONE</option>");
  Statement st21 = Conn.createStatement();
  String q21 = "SELECT * FROM VENDOR";
  ResultSet r21 = st21.executeQuery(q21);
  while(r21.next()) {
    out.print("<option");
    if (VENDORID.equals(r21.getString("ID"))) {
      out.print(" selected");
    }
    out.print(">"+r21.getString("ID")+" - "+r21.getString("NAME")+"</option>");
  }
  st21.close();
  out.print("</select></td></tr>");    

  out.print("<tr><td>End of support: </td><td><INPUT TYPE=\"text\" NAME=\"ESDATE\" VALUE=\""+ESDAY+"/"+ESMONTH+"/"+ESYEAR+"\" SIZE=25>");
  out.print("</td><td><A HREF=\"#\" onClick=\"cal.select(document.forms['formFILTER'].ESDATE,'anchor1','MM/dd/yyyy'); return false;\" NAME=\"anchor1\" ID=\"anchor1\">Calendar</A></td></tr>");


  out.print("<tr><td>&nbsp</td><td><input type=\"submit\" name=\"Save\" value=\"Assign\"></td></tr></center>");

  out.print("</table>");
  out.print("</form>");

%>
<div align="center"></div>
<div align="center"></div>

</body>

</html>
