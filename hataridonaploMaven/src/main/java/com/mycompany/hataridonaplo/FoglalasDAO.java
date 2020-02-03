package com.mycompany.hataridonaplo;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ferenc
 * Adatbázis kommunikációhoz szükséges függvények
 */
public class FoglalasDAO {

    String hibaNev = "";
    Exception hiba = null;
    private Connection conn = null;
    String idopont;
    String nev;
    String email;
    String eszkoz;

    /**
     * Adatbázishoz kapcsolódás
     * @return 
    */
    public Connection getConnection() {
        if (conn == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String DB_URL = "jdbc:mysql://localhost:3306/HurcifeszekDB";
                String USER = "netbeans";
                String PASS = "netbeans";
                conn = DriverManager.getConnection(DB_URL, USER, PASS);
            } catch (ClassNotFoundException ex) {
                conn = null;
                setHiba("db mySQL", ex);
                Logger.getLogger(FoglalasDAO.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                conn = null;
                setHiba("db connect", ex);
                Logger.getLogger(FoglalasDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return conn;
    }
    
    /**
     * Hibakezelés
    */
    private void setHiba(String nev, Exception e) {
        hibaNev = nev;
        hiba = e;
        System.out.println("LFP_ERROR " + nev + ":" + e);
        e.printStackTrace(System.out);
    }
    /**
     * Új foglalás létrehozása bekért paraméterek alapján
     * @param idopont
     * @param nev
     * @param email
     * @param eszkoz
     * @param telefon
    */
    public void ujFoglalas(String idopont, String nev, String email, String eszkoz, String telefon) {
        try {
            Statement stmt = null;
            String sql = String.format("INSERT INTO HurcifeszekDB.Foglalas(idopont, nev, eszkoz, email, telefon) "
                    + "VALUES ('%s','%s','%s','%s','%s')", idopont,  nev, eszkoz, email, telefon);
            System.out.println("Connected database successfully...");
            System.out.println("Creating statement...");
            try {
                stmt = getConnection().createStatement();
                stmt.execute(sql);
            } catch (SQLException ex) {
                Logger.getLogger(FoglalasDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(FoglalasDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /**
     * Adatbázisból kikérdezés a foglalás adatairól
     * @return 
     * @throws java.sql.SQLException 
    */
    public ResultSet FoglalasokKiadasa() throws SQLException {
        Statement stmt;
        System.out.println("Connected database successfully...");
        System.out.println("Creating statement...");
        stmt = getConnection().createStatement();
        String sql2 = "SELECT * FROM HurcifeszekDB.Foglalas WHERE id = (SELECT MAX(id) FROM HurcifeszekDB.Foglalas)";
        ResultSet rs = stmt.executeQuery(sql2);
        return rs;
    }
    
}
