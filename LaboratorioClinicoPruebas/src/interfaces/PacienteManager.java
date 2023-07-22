/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */

/**
 *
 * @author ixcot
 */
package interfaces;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PacienteManager {
    private int currentIndex = 1;
    private Connection connection;

    public PacienteManager(Connection connection) {
        this.connection = connection;
    }

    public Paciente obtenerPacienteActual() {
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM pacientes WHERE expediente = ?");
            statement.setInt(1, currentIndex);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int expediente = resultSet.getInt("expediente");
                String nombre = resultSet.getString("nombre");
                String genero = resultSet.getString("genero");
                String fechaNacimiento = resultSet.getString("fecha_nacimiento");
                String telefono = resultSet.getString("telefono");
                String nit = resultSet.getString("nit");
                String codigoAuxiliar = resultSet.getString("codigo_auxiliar");
                String tipoMuestra = resultSet.getString("tipo_muestra");
                String direccion = resultSet.getString("direccion");
                String quienRefiere = resultSet.getString("quien_refiere");

                return new Paciente(expediente, nombre, genero, fechaNacimiento, telefono, nit, codigoAuxiliar, tipoMuestra, direccion, quienRefiere);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public void siguientePaciente() {
        int totalPacientes = getTotalPacientes();
        if (currentIndex < totalPacientes) {
            currentIndex++;
        }
    }

    public void pacienteAnterior() {
        if (currentIndex > 1) {
            currentIndex--;
        }
    }

    private int getTotalPacientes() {
        int totalPacientes = 0;

        try {
            java.sql.Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) AS total FROM pacientes");
            if (resultSet.next()) {
                totalPacientes = resultSet.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalPacientes;
    }
}

