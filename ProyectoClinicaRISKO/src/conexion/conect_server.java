//CLASE PARA CONECTARNOS A LA RED
package conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class conect_server {
    
    private static Connection conn;
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String USER = "root";
    private static final String PASSWORD = "12345";
    private static final String URL = "jdbc:mysql://localhost:3306/LabClinico?autoReconnect=true&useSSL=false";

    public conect_server() {
        conn = null;
    }
    
    //Este método permitira retornar la conexión
    public Connection getConnection(){
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException ex){
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error al conectar con la base de datos", JOptionPane.ERROR_MESSAGE);
            System.exit(0);
        }
        return conn;
    }
    
    //Este método permite desconectar de la base de datos
    public void desconectar(){
        try{
          conn.close();  
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error al desconectar", JOptionPane.ERROR_MESSAGE);
        }
        
    }
}
