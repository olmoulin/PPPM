
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
        String PROJECTID = request.getParameter("PROJECTID");
        String ptmp = request.getParameter("PAGE");
        String PRODUCTID = request.getParameter("PRODUCTID");
        String PROGRAMID = request.getParameter("PROGRAMID");
        String REQTYPE = request.getParameter("REQTYPE");

        int PAGE=0;
        if (ptmp==null) {
          PAGE=0;
        } else {
          PAGE=Integer.parseInt(ptmp);
        }      	
        out.print("<center><strong><h1>Pick Portfolio</h1></strong></center><hr>");
        if (REQTYPE.equals("PROJECT")) {
          out.print("<Table><tr><td>You are here : Request \\ <A HREF=\"approverequest.jsp?TODO=NONE&PROJECTID="+PROJECTID+"&REQTYPE="+REQTYPE+"\">Approve request</A> \\ Add Portfolio </td><td><A HREF=\"pickrequestportfolio.jsp?TODO=NONE&PROJECTID="+PROJECTID+"&REQTYPE="+REQTYPE+"\"><img border=0 src=\"icons/reload.png\"></A></td></tr></table>");
          out.print("<hr>");
          int nbpage=0;
          Statement st230 = Conn.createStatement();
          String q230 = "SELECT COUNT(ID) FROM PORTFOLIO WHERE ID NOT IN (SELECT PORTFOLIOID FROM PRJPOR WHERE PROJECTID='"+PROJECTID+"')";
          ResultSet r230 = st230.executeQuery(q230);
          if (r230.next()) {    
            nbpage=r230.getInt("COUNT(ID)")/20;
          }
          st230.close();
          out.print("<table><tr><td>Page : </td>");
          for (int i=0; i<=nbpage;i++) {
            out.print("<td><A HREF=\"pickrequestportfolio.jsp?TODO=ADD&PAGE="+i+"&PROJECTID="+PROJECTID+"&REQTYPE="+REQTYPE+"\">"+i+"</A></td>");
          }
          out.print("</tr></table>");
          out.print("<table border=\"0\" CELLSPACING=\"2\" BORDERCOLOR=\"#000000\" width=\"100%\">");
          out.print("<tr height=\"30\">");
          out.print("<td width=\"10%\">&nbsp;</td>");
          out.print("<td width=\"80%\" background=\"images/fond_titre.jpg\"><center>Portfolio</center></td>");
          out.print("<td width=\"10%\">&nbsp;</td>");
          out.print("</tr>");
          Statement STR01 = Conn.createStatement();
          String QR01 = "SELECT ID,NAME FROM PORTFOLIO WHERE ID NOT IN (SELECT PORTFOLIOID FROM PRJPOR WHERE PROJECTID='"+PROJECTID+"')";
          ResultSet R01 = STR01.executeQuery(QR01);
          int pagecount=0;
          while(R01.next()) {
            if (pagecount>=PAGE*20 && pagecount<(PAGE+1)*20) {
              out.print("<tr>");
              out.print("<td>&nbsp;</td>");
              out.print("<td bgcolor=\"#FFFFFF\"><A HREF=\"approverequest.jsp?TODO=PORTADD&PORTFOLIOID="+R01.getString("ID")+"&PROJECTID="+PROJECTID+"&REQTYPE="+REQTYPE+"\">"+R01.getString("NAME")+"</td>");
              out.print("<td>&nbsp;</td>");
              out.print("</tr>");
            }
            pagecount++;
          }
          STR01.close();
          out.print("</table>");
          out.print("<A HREF=\"approverequest.jsp?TODO=NONE&PROJECTID="+PROJECTID+"&REQTYPE="+REQTYPE+"\"><img border=0 src=\"icons/cancel.png\"></A>");
        } else {
          if (REQTYPE.equals("PRODUCT")) {
            out.print("<Table><tr><td>You are here : Request \\ <A HREF=\"approverequest.jsp?TODO=NONE&PRODUCTID="+PRODUCTID+"&REQTYPE="+REQTYPE+"\">Approve request</A> \\ Add Portfolio </td><td><A HREF=\"pickrequestportfolio.jsp?TODO=NONE&PRODUCTID="+PRODUCTID+"&REQTYPE="+REQTYPE+"\"><img border=0 src=\"icons/reload.png\"></A></td></tr></table>");
            out.print("<hr>");
            int nbpage=0;
            Statement st230 = Conn.createStatement();
            String q230 = "SELECT COUNT(ID) FROM PORTFOLIO WHERE ID NOT IN (SELECT PORTFOLIOID FROM PRDPOR WHERE PRODUCTID='"+PRODUCTID+"')";
            ResultSet r230 = st230.executeQuery(q230);
            if (r230.next()) {    
              nbpage=r230.getInt("COUNT(ID)")/20;
            }
            st230.close();
            out.print("<table><tr><td>Page : </td>");
            for (int i=0; i<=nbpage;i++) {
              out.print("<td><A HREF=\"pickrequestportfolio.jsp?TODO=ADD&PAGE="+i+"&PRODUCTID="+PRODUCTID+"&REQTYPE="+REQTYPE+"\">"+i+"</A></td>");
            }
            out.print("</tr></table>");
            out.print("<table border=\"0\" CELLSPACING=\"2\" BORDERCOLOR=\"#000000\" width=\"100%\">");
            out.print("<tr height=\"30\">");
            out.print("<td width=\"10%\">&nbsp;</td>");
            out.print("<td width=\"80%\" background=\"images/fond_titre.jpg\"><center>Site / Location</center></td>");
            out.print("<td width=\"10%\">&nbsp;</td>");
            out.print("</tr>");
            Statement STR01 = Conn.createStatement();
            String QR01 = "SELECT ID,NAME FROM PORTFOLIO WHERE ID NOT IN (SELECT PORTFOLIOID FROM PRDPOR WHERE PRODUCTID='"+PRODUCTID+"')";
            ResultSet R01 = STR01.executeQuery(QR01);
            int pagecount=0;
            while(R01.next()) {
              if (pagecount>=PAGE*20 && pagecount<(PAGE+1)*20) {
                out.print("<tr>");
                out.print("<td>&nbsp;</td>");
                out.print("<td bgcolor=\"#FFFFFF\"><A HREF=\"approverequest.jsp?TODO=PORTADD&PORTFOLIOID="+R01.getString("ID")+"&PRODUCTID="+PRODUCTID+"&REQTYPE="+REQTYPE+"\">"+R01.getString("NAME")+"</td>");
                out.print("<td>&nbsp;</td>");
                out.print("</tr>");
              }
              pagecount++;
            }
            STR01.close();
            out.print("</table>");
            out.print("<A HREF=\"approverequest.jsp?TODO=NONE&PRODUCTID="+PRODUCTID+"&REQTYPE="+REQTYPE+"\"><img border=0 src=\"icons/cancel.png\"></A>");
          } else {
            out.print("<Table><tr><td>You are here : Request \\ <A HREF=\"approverequest.jsp?TODO=NONE&PRODUCTID="+PRODUCTID+"&REQTYPE="+REQTYPE+"\">Approve request</A> \\ Add Portfolio </td><td><A HREF=\"pickrequestportfolio.jsp?TODO=NONE&PROGRAMID="+PROGRAMID+"&REQTYPE="+REQTYPE+"\"><img border=0 src=\"icons/reload.png\"></A></td></tr></table>");
            out.print("<hr>");
            int nbpage=0;
            Statement st230 = Conn.createStatement();
            String q230 = "SELECT COUNT(ID) FROM PORTFOLIO WHERE ID NOT IN (SELECT PORTFOLIOID FROM PGMPOR WHERE PROGRAMID='"+PROGRAMID+"')";
            ResultSet r230 = st230.executeQuery(q230);
            if (r230.next()) {    
              nbpage=r230.getInt("COUNT(ID)")/20;
            }
            st230.close();
            out.print("<table><tr><td>Page : </td>");
            for (int i=0; i<=nbpage;i++) {
              out.print("<td><A HREF=\"pickrequestportfolio.jsp?TODO=ADD&PAGE="+i+"&PROGRAMID="+PROGRAMID+"&REQTYPE="+REQTYPE+"\">"+i+"</A></td>");
            }
            out.print("</tr></table>");
            out.print("<table border=\"0\" CELLSPACING=\"2\" BORDERCOLOR=\"#000000\" width=\"100%\">");
            out.print("<tr height=\"30\">");
            out.print("<td width=\"10%\">&nbsp;</td>");
            out.print("<td width=\"80%\" background=\"images/fond_titre.jpg\"><center>Site / Location</center></td>");
            out.print("<td width=\"10%\">&nbsp;</td>");
            out.print("</tr>");
            Statement STR01 = Conn.createStatement();
            String QR01 = "SELECT ID,NAME FROM PORTFOLIO WHERE ID NOT IN (SELECT PORTFOLIOID FROM PGMPOR WHERE PROGRAMID='"+PROGRAMID+"')";
            ResultSet R01 = STR01.executeQuery(QR01);
            int pagecount=0;
            while(R01.next()) {
              if (pagecount>=PAGE*20 && pagecount<(PAGE+1)*20) {
                out.print("<tr>");
                out.print("<td>&nbsp;</td>");
                out.print("<td bgcolor=\"#FFFFFF\"><A HREF=\"approverequest.jsp?TODO=PORTADD&PORTFOLIOID="+R01.getString("ID")+"&PROGRAMID="+PROGRAMID+"&REQTYPE="+REQTYPE+"\">"+R01.getString("NAME")+"</td>");
                out.print("<td>&nbsp;</td>");
                out.print("</tr>");
              }
              pagecount++;
            }
            STR01.close();
            out.print("</table>");
            out.print("<A HREF=\"approverequest.jsp?TODO=NONE&PROGRAMID="+PROGRAMID+"&REQTYPE="+REQTYPE+"\"><img border=0 src=\"icons/cancel.png\"></A>");
          }
        }
        Conn.close();
      }

    %>
  </body>
</html>
