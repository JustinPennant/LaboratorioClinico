//ESTA CLASE SERVIRÁ PARA CONECTAR APROPIADAMENTE CON LA BASE DE DATOS
package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class conectar {
    
    private static Connection conn;
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String USER = "root";
    private static final String PASSWORD = "12345";
    private static final String URL = "jdbc:mysql://localhost:3306/labclinico?characterEncoding=UTF-8";

    public conectar() {
        conn = null;
    }
    
    //Este método permitira retornar la conexión
    public Connection getConnection(){
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            if(conn != null){
                JOptionPane.showMessageDialog(null, "Conexión Establecida");
            }
        } catch (ClassNotFoundException | SQLException ex){
            JOptionPane.showMessageDialog(null, "Error al realizar conexión: " + ex);
            System.exit(0);
        }
        return conn;
    }
    
    //Este método permite desconectar de la base de datos
    public void desconectar(){
        try{
          conn.close();
          JOptionPane.showMessageDialog(null, "Desconexión exitosa");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error al desconectar", JOptionPane.ERROR_MESSAGE);
        }
        
    }
}