/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.util.List;

/**
 *
 * @author jotaz
 */
public class Preguntas {

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
     * @return the cod_tema
     */
    public String getCod_tema() {
        return cod_tema;
    }

    /**
     * @param cod_tema the cod_tema to set
     */
    public void setCod_tema(String cod_tema) {
        this.cod_tema = cod_tema;
    }

    /**
     * @return the pregunta
     */
    public String getPregunta() {
        return pregunta;
    }

    /**
     * @param pregunta the pregunta to set
     */
    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    /**
     * @return the respuestas
     */
    public List<Respuestas> getRespuestas() {
        return respuestas;
    }

    /**
     * @param respuestas the respuestas to set
     */
    public void setRespuestas(List<Respuestas> respuestas) {
        this.respuestas = respuestas;
    }
    private int cod_pregunta;
    private String cod_tema;
    private String pregunta;
    //private int Imagenes;
    private List<Respuestas> respuestas;
}
