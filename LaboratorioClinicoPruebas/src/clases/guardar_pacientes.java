
package clases;

import java.sql.PreparedStatement;
import javax.swing.JOptionPane;

public class guardar_pacientes {
    
    private final String SQL_INSERT = "INSERT INTO TB_EXPEDIENTE (nombre_ex, genero_ex, telefono_ex, nit_ex, direccion_ex, quien_refiere, tipo_muestra, codigo_auxiliar, fecha_nacimiento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private PreparedStatement PS;
    private final conectar CN;
    
    public guardar_pacientes(){
        PS = null;
        CN = new conectar();
    }
    
    public int insertDatos(String nombre_ex, String genero_ex, String telefono_ex, String nit_ex, String direccion_ex, String quien_refiere, String tipo_muestra, String codigo_auxiliar, String fecha_nacimiento){
        try {
            PS = CN.getConnection().prepareStatement(SQL_INSERT);
            PS.setString(1, nombre_ex);
            PS.setString(2, genero_ex);
            PS.setString(3, telefono_ex);
            PS.setString(4, nit_ex);
            PS.setString(5, direccion_ex);
            PS.setString(6, quien_refiere);
            PS.setString(7, tipo_muestra);
            PS.setString(8, codigo_auxiliar);
            PS.setString(9, fecha_nacimiento);
            int res = PS.executeUpdate();
            if(res > 0){
                JOptionPane.showMessageDialog(null, "Registro Guardado");
            }
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, "Error al guardar los datos en DB: " + e);
        } finally {
            PS = null;
            CN.desconectar();
        }
        return 0;
    }

    public void setInt(int i, int parseInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int executeUpdate() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
