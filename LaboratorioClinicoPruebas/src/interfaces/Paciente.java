/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */

/**
 *
 * @author ixcot
 */
package interfaces;

public class Paciente {
    private int expediente;
    private String nombre;
    private String genero;
    private String fechaNacimiento;
    private String telefono;
    private String nit;
    private String codigoAuxiliar;
    private String tipoMuestra;
    private String direccion;
    private String quienRefiere;

    // Constructor
    public Paciente(int expediente, String nombre, String genero, String fechaNacimiento, String telefono,
                    String nit, String codigoAuxiliar, String tipoMuestra, String direccion, String quienRefiere) {
        this.expediente = expediente;
        this.nombre = nombre;
        this.genero = genero;
        this.fechaNacimiento = fechaNacimiento;
        this.telefono = telefono;
        this.nit = nit;
        this.codigoAuxiliar = codigoAuxiliar;
        this.tipoMuestra = tipoMuestra;
        this.direccion = direccion;
        this.quienRefiere = quienRefiere;
    }

    // Getters y setters para acceder a los atributos de Paciente
    public int getExpediente() {
        return expediente;
    }

    public void setExpediente(int expediente) {
        this.expediente = expediente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getCodigoAuxiliar() {
        return codigoAuxiliar;
    }

    public void setCodigoAuxiliar(String codigoAuxiliar) {
        this.codigoAuxiliar = codigoAuxiliar;
    }

    public String getTipoMuestra() {
        return tipoMuestra;
    }

    public void setTipoMuestra(String tipoMuestra) {
        this.tipoMuestra = tipoMuestra;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getQuienRefiere() {
        return quienRefiere;
    }

    public void setQuienRefiere(String quienRefiere) {
        this.quienRefiere = quienRefiere;
    }
}
