
package testbd;

import java.sql.*;
//import java.sql.DriverManager;
import javax.swing.JOptionPane;


public class Conectate
{
    private String driver ="com.mysql.jdbc.Driver";
    private String cadenaConexion = "jdbc:mysql://127.0.0.1/jardines";
    private String usuario = "root";
    private String contraseña = "";
    public Connection con;
    
    public Conectate ()
    {
        try{
      Class.forName(driver);
      con = DriverManager.getConnection(cadenaConexion, usuario, contraseña);
        //JOptionPane.showMessageDialog(null, "conexion a la BD exitosa");
        }catch (Exception e){
            JOptionPane.showMessageDialog(null, "No se pudo establecer la conexion a la BD ..."+e.getMessage());
        }
       // return sql;
    }
    
     public int validarUsr(String usr, String pass)
  {
       String user = usr, passw = pass;
    int tipo = 0;
    String SQL = "{?=CALL valida_usr(?,?)}";
     try{
         
        con.setAutoCommit(false);
         CallableStatement cs = con.prepareCall(SQL);
         cs.registerOutParameter(1, Types.INTEGER);
         cs.setString(2, user);
	 cs.setString(3, passw);
         cs.execute();
          tipo = cs.getInt(1); 
        
                    
             
        }catch(SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println("Error: " + ex.getMessage());
            }
        }
    return  tipo;

  }
  
}

