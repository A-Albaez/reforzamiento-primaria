/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author jotaz
 */
public class Temas {

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
     * @return the nombre
     */
    public String getNombre_tema() {
        return nombre_tema;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre_tema(String nombre) {
        this.nombre_tema = nombre;
    }

    /**
     * @return the ds_contenido
     */
    public String getContenido() {
        return contenido;
    }

    /**
     * @param contenido
     */
    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    /**
     * @return the preguntas
     */
    public List<Preguntas> getPreguntas() {
        return preguntas;
    }

    /**
     * @param preguntas the preguntas to set
     */
    public void setPreguntas(List<Preguntas> preguntas) {
        this.preguntas = preguntas;
    }
    
    private String cod_tema;
    private String nombre_tema;
    private String contenido;
    
    private List<Preguntas> preguntas;
    
    public JSONObject toJson(){
        JSONObject json = new JSONObject();
                
        try {
            json.put("cod_tema", this.cod_tema);
            json.put("nombre", this.nombre_tema);
            json.put("ds_contenido", this.contenido);
        
            json.put("preguntas", this.preguntas);
        } catch (JSONException ex) {
            Logger.getLogger(Temas.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return json;
    }
}
