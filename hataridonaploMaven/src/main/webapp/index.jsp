<%-- x
    Document   : index
    Created on : 2019. okt. 28., 12:05:09
    Author     : Ferenc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width-device-width", initial-scale="1.0">
        <%-- Az adatbázishoz szükséges függvényektára--%>
        <jsp:useBean id= "DB" scope= "application" 
                     class= "com.mycompany.hataridonaplo.FoglalasDAO" 
                     type= "com.mycompany.hataridonaplo.FoglalasDAO"/>
        <title>Bejelentkezés Hurcifészek</title>
        <link type="text/css" rel="stylesheet" href="./css/style.css"/>
    </head>
    <body>
        <div class="hatter1" align="center">
            <%-- Időpont foglaláshoz szükséges adatok bekérése--%>
            <h1>Időpont foglalás</h1>
            <form action="./bejegyzes.jsp">
                Melyik időpontra szeretne foglalni?: <br>
                <select name="idopont">
                    <option value="8 óra">8.00</option>
                    <option value="9 óra">9.00</option>
                    <option value="10 óra">10.00</option>
                    <option value="11 óra">11.00</option>
                    <option value="12 óra">12.00</option>
                </select>
                <br>
                Neve: <br>
                <input type="text" name="nev" value=${param["nev"]}>
                <br>
                Email: <br>
                <input type="text" name="email" value=${param["email"]}>
                <br>
                Telefon: <br>
                <input type="text" name="telefon" value=${param["telefon"]}>
                <br>
                Milyen eszközt szeretne próbálni:<br>
                <select name="eszkoz">
                    <option value="kendo">kendo</option>
                    <option value="maitai">maitai</option>
                    <option value="csatos">csatos</option>
                    <option value="karikas">karikas</option> 
                </select>
                <br><br>
                <input type="submit" value="Submit">
            </form>
        </div>
    </body>
</html>
