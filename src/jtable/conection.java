 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jtable;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author RAMYAMUKESH
 */
public class conection {
    
    private static String servername="localhost";
    private static String user="root";
    private static String dbn="controls";
    private static Integer pn= 3306;
    private static String password = "";
    
    
    public static Connection getConnection()
    {
        Connection cnx=null;
        MysqlDataSource datasource= new MysqlDataSource();
        datasource.setServerName(servername);
        datasource.setUser(user);
        datasource.setPassword(password);
        datasource.setDatabaseName(dbn);
        datasource.setPortNumber(pn);
        try {
            datasource.getConnection();
        } catch (SQLException ex) {
            Logger.getLogger(conection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cnx;
    }
}
