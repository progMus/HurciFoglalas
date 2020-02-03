<%-- 
    Document   : bejegyzes
    Created on : 2019. okt. 28., 11:34:52
    Author     : Ferenc
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mycompany.hataridonaplo.FoglalasDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang ="hu-hu">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%-- Visszaigazolás a foglalásról--%>
        <title>Időpont lefoglalva</title>       
    </head>
    <body>
        <div class="hatter2" align="center">
         <%
        //paraméterek begyűjtése
        String time = request.getParameter("idopont");
        String e = request.getParameter("eszkoz");
        String n = request.getParameter("nev");
        String m = request.getParameter("email");
        String t = request.getParameter("telefon");
        
        //foglalás az adatbázisba
        FoglalasDAO f = new FoglalasDAO();
        f.ujFoglalas(time, n, e, m, t);
        %>
        <h1>Időpont lefoglalva</h1>
        <table>
        <caption align="top">Foglalásod adatai</caption>
        <tr><td><%
            //foglalás adatainak kilistázása adatbbázisból
            ResultSet eredmeny;
            eredmeny = (f.FoglalasokKiadasa());
            ResultSetMetaData rsmd = eredmeny.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            while (eredmeny.next()) {
                for (int i = 2; i <= columnsNumber; i++) {
                     if (i > 2) out.print(",  ");
                     String columnValue = eredmeny.getString(i);
                     out.print(rsmd.getColumnName(i)+ ": " + columnValue );
             }
            }
        %></td>
        </table>
        <form action="./index.jsp">
            <br>
            <input type="submit" value="Vissza a foglaláshoz">
        </form>
        </div>
    </body>
</html>
