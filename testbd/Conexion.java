/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package testbd;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import javax.swing.JOptionPane;

/**
 *
 * @author Hernandez
 */
public class Conexion
{
    Statement stmt = null;
    Connection conect = null;
    public static Connection sql; 
    ///
    public static String cadenaConexion = "jdbc:mysql://127.0.0.1/jardines";
    public static String usuario = "root";
    public static String contraseña = "";
    public static String driver ="com.mysql.jdbc.Driver";
    
  
    
    
    public static Connection conectar() 
   {
        
        try {
            //Class.forName(driver);
            sql = DriverManager.getConnection(cadenaConexion, usuario, contraseña);
            
           // String connectionUrl = "jdbc:mysql://127.0.0.1/jardines;user=root; password =;";
         //sql = DriverManager.getConnection(connectionUrl);
         JOptionPane.showMessageDialog(null, "conexion a la BD exitosa 2");
        } 
    catch (SQLException ex) 
    {
     JOptionPane.showMessageDialog(null, "conexion a la BD fallo 2");
    }
    return sql;
   
   }
    
      public int validarUsr(String usr, String pass)
  {
       String user = usr, passw = pass;
    int tipo = 0;
    String SQL = "{?=CALL valida_usr(?,?)}";
     try{
         conect = Conexion.conectar();
        conect.setAutoCommit(false);
         CallableStatement cs = conect.prepareCall(SQL);
         cs.registerOutParameter(1, Types.INTEGER);
         cs.setString(2, user);
	 cs.setString(3, passw);
         cs.execute();
          tipo = cs.getInt(1); 
        
                    
             
        }catch(SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            try {
                conect.close();
            } catch (SQLException ex) {
                System.out.println("Error: " + ex.getMessage());
            }
        }
    return  tipo;

  }
    
}
