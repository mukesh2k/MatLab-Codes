/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jtable;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author RAMYAMUKESH
 */
public class connect {
    private static String url="jdbc:mysql://localhost:3306/controls?verifyServerCertificate=false&useSSL=true";
    private static String una="root";
    private static String pas="Thunder@123";
     public static Connection con=null;
    public connect() throws SQLException{
          
          con  = DriverManager.getConnection(url,una,pas);
            
            }
}
