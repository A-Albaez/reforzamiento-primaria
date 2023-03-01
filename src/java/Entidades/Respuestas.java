/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author jotaz
 */
public class Respuestas {

    /**
     * @return the cod_preg
     */
    public int getCod_pregunta() {
        return cod_pregunta;
    }

    /**
     * @param cod_preg the cod_preg to set
     */
    public void setCod_pregunta(int cod_preg) {
        this.cod_pregunta = cod_preg;
    }

    /**
     * @return the id_opc
     */
    public char getIdent_opcion() {
        return ident_opcion;
    }

    /**
     * @param id_opc the id_opc to set
     */
    public void setIdent_opcion(char id_opc) {
        this.ident_opcion = id_opc;
    }

    /**
     * @return the opc_resp
     */
    public String getOpcion_resp() {
        return opcion_resp;
    }

    /**
     * @param opc_resp the opc_resp to set
     */
    public void setOpcion_resp(String opc_resp) {
        this.opcion_resp = opc_resp;
    }

    /**
     * @return the resp
     */
    public char getRespuesta() {
        return respuesta;
    }

    /**
     * @param resp the resp to set
     */
    public void setRespuesta(char resp) {
        this.respuesta = resp;
    }

    /**
     * @return the retroali
     */
    public String getRetroalimentacion() {
        return retroalimentacion;
    }

    /**
     * @param retroali the retroali to set
     */
    public void setRetroalimentacion(String retroali) {
        this.retroalimentacion = retroali;
    }
    private int cod_pregunta;
    private char ident_opcion;
    private String opcion_resp;
    private char respuesta;
    private String retroalimentacion;
    //private int imagenes;    
}
