
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
        String PORTFOLIOID = request.getParameter("PORTFOLIOID");
        String ptmp = request.getParameter("PAGE");

        int PAGE=0;
        if (ptmp==null) {
          PAGE=0;
        } else {
          PAGE=Integer.parseInt(ptmp);
        }
      	out.print("<center><strong><h1>Project(s)</h1></strong></center><hr>");
        out.print("You are here : Portfolio \\ <A HREF=\"portconfig.jsp?TODO=NONE\" target=\"appliFrame\"> Portfolio configuration</A> \\ <A HREF=\"portfoliogroupaccess.jsp?TODO=NONE&PORTFOLIOID="+PORTFOLIOID+"\" target=\"appliFrame\">Portfolio access</A> \\ Add access");
        out.print("<hr>");
        out.print("<form name=\"formFILTER\" method=\"post\" action=\"pickportfoliogroupaccess.jsp?TODO=FILTER&FILTER=FILTER&PORTFOLIOID="+PORTFOLIOID+"&PAGE=0\" target=\"appliFrame\">");
        String LASTFILTERNAME=null;
        Statement st123b = Conn.createStatement();
        String q123b = "SELECT FILTERVALUE FROM FILTER WHERE LOGIN='"+Userlogin+"' AND FILTERNAME='LASTFILTERNAMEPICKPORTGRPACC'";
        ResultSet r123b = st123b.executeQuery(q123b);
        if (r123b.next()) {
          LASTFILTERNAME=r123b.getString("FILTERVALUE");
        }
        st123b.close();
        String filter = request.getParameter("FILTER");
        String filterstatement ="";
        String filstrNAME=request.getParameter("SELECTFILTERNAME");
        if (filstrNAME==null) {
          if (LASTFILTERNAME!=null) {
            filter="FILTER";
            filstrNAME=LASTFILTERNAME;
          } else {
            filter=null;
            filstrNAME="";
          }
        } else {
          if (LASTFILTERNAME!=null) {
            Statement sti2 = Conn.createStatement();
            String i2 = "UPDATE FILTER SET FILTERVALUE='"+filstrNAME+"' WHERE LOGIN='"+Userlogin+"' AND FILTERNAME='LASTFILTERNAMEPICKPORTGRPACC'";
            sti2.executeUpdate(i2);
            sti2.close();
          } else {
            Statement sti2 = Conn.createStatement();
            String i2 = "INSERT INTO FILTER VALUES('"+Userlogin+"','LASTFILTERNAMEPICKPORTGRPACC','"+filstrNAME+"')";
            sti2.executeUpdate(i2);
            sti2.close();
          }
        }
        out.print("<table border=\"1\" CELLSPACING=\"0\" BORDERCOLOR=\"#9F9F9F\" width=\"100%\">");
        out.print("<tr><td bgcolor=#FFFFFF>");
        out.print("<table width=\"100%\"><tr>");
        out.print("<td bgcolor=#FFFFFF>");
        out.print("Name : </td><td><input name=\"SELECTFILTERNAME\" type=\"text\" size=\"50\" value=\""+filstrNAME+"\">");
        out.print("</td>");
        out.print("<td>");
        out.print("<input type=\"image\" border=0 src=\"icons/search.png\" name=\"filter\" value=\"submit\"></center>");
        out.print("</td>");
        out.print("</tr></table>");
        out.print("</td>");
        out.print("</tr></table>");
        out.print("<br>");
        out.print("</form>");
        boolean first=true;
        if (filter!= null) {
          String idfilNAME = filstrNAME;
          if (!idfilNAME.equals("")) {
              filterstatement = filterstatement + "MATCH (NAME) AGAINST ('"+filstrNAME+"*' IN BOOLEAN MODE)";
            first = false;
          }
        }
        if (first) {
          filterstatement="";
        } else {
          filterstatement=filterstatement+" AND ";
        }

        int nbpage=0;
        Statement st230 = Conn.createStatement();
        String q230 = "SELECT COUNT(ID) FROM GROUPS WHERE "+filterstatement+" ID NOT IN (SELECT GROUPID FROM GRPPOR WHERE PORTFOLIOID='"+PORTFOLIOID+"')";
        ResultSet r230 = st230.executeQuery(q230);
        if (r230.next()) {    
          nbpage=r230.getInt("COUNT(ID)")/20;
        }
        st230.close();
        String NAME = "";
        out.print("<table><tr><td>Page : </td>");
        for (int i=0; i<=nbpage;i++) {
          out.print("<td><A HREF=\"pickportfoliogroupaccess.jsp?TODO=ADD&PAGE="+i+"&PORTFOLIOID="+PORTFOLIOID+"\">"+i+"</A></td>");
        }
        out.print("</tr></table>");
        out.print("<table border=\"0\" CELLSPACING=\"2\" BORDERCOLOR=\"#000000\" width=\"100%\">");
        out.print("<tr height=\"30\">");
        out.print("<td width=\"10%\">&nbsp;</td>");
        out.print("<td width=\"80%\" background=\"images/fond_titre.jpg\"><center>Group to give management on the portfolio</center></td>");
        out.print("<td width=\"10%\">&nbsp;</td>");
        out.print("</tr>");
        Statement STR01 = Conn.createStatement();
        String QR01 = "SELECT ID,NAME FROM GROUPS WHERE "+filterstatement+" ID NOT IN (SELECT GROUPID FROM GRPPOR WHERE PORTFOLIOID='"+PORTFOLIOID+"')";
        ResultSet R01 = STR01.executeQuery(QR01);
        int pagecount=0;
        while(R01.next()) {
          if (pagecount>=PAGE*20 && pagecount<(PAGE+1)*20) {
            out.print("<tr>");
            out.print("<td>&nbsp;</td>");
            out.print("<td bgcolor=\"#FFFFFF\"><A HREF=\"portfoliogroupaccess.jsp?TODO=ADD&GROUPID="+R01.getString("ID")+"&PORTFOLIOID="+PORTFOLIOID+"\">"+R01.getString("NAME")+"</td>");
            out.print("<td>&nbsp;</td>");
            out.print("</tr>");
          }
          pagecount++;
        }
        STR01.close();
        out.print("</table>");
        out.print("<A HREF=\"portfoliogroupaccess.jsp?TODO=NONE&PORTFOLIOID="+PORTFOLIOID+"\"><img border=0 src=\"icons/cancel.png\"></A>");
        Conn.close();
      }

    %>
  </body>
</html>
