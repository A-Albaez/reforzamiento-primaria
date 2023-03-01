/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Preguntas;
import Entidades.Respuestas;
import Entidades.Temas;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jotaz
 */
public class Jugabilidad {
    private Connection cn;
    
    public Jugabilidad(){
        Conectar conexion = new Conectar();
        this.cn = conexion.getCn();
    }
    
    public Temas ObtenerTemaCompleto(String codigo){
        try{
            Temas tema = new Temas();
            Statement stmt = this.cn.createStatement();
            String query = "SELECT * FROM TEMA WHERE cod_tema = '"+codigo+"'";
            
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                tema.setCod_tema(result.getString("cod_tema"));
                tema.setContenido(result.getString("contenido"));
                tema.setNombre_tema(result.getString("nombre_tema"));
                
                tema.setPreguntas(this.ObtenerPreguntasByTema(codigo));
            }
            return tema;
            
        }catch(Exception e){
            int x = 1;
        }
        return null;
    }
    
    private List<Preguntas> ObtenerPreguntasByTema(String cod_tema){
        List<Preguntas> preguntas = new ArrayList<>();
        try{
            Statement stmt = this.cn.createStatement();
            String query = "SELECT * FROM PREGUNTA WHERE cod_tema ='"+cod_tema+"'";
            
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Preguntas pregunta = new Preguntas();
                pregunta.setCod_pregunta(result.getInt("cod_pregunta"));
                pregunta.setCod_tema(result.getString("cod_tema"));
                pregunta.setPregunta(result.getString("pregunta"));
                
                pregunta.setRespuestas(this.ObtenerRespuestasByPregunta(pregunta.getCod_pregunta()));
                
                preguntas.add(pregunta);
            }
            return preguntas;
        }catch(Exception e){
            int x = 1;
        }
        return preguntas;
    }
    
    private List<Respuestas> ObtenerRespuestasByPregunta(int cod_preg){
        List<Respuestas> respuestas = new ArrayList<>();
        try{
            Statement stmt = this.cn.createStatement();
            String query = "SELECT * FROM RESPUESTA WHERE cod_pregregunta="+cod_preg;
            
            ResultSet result = stmt.executeQuery(query);
            while(result.next()){
                Respuestas respuesta = new Respuestas();
                respuesta.setCod_pregunta(result.getInt("cod_pregregunta"));
                respuesta.setIdent_opcion(result.getString("ident_opcion").charAt(0));
                respuesta.setOpcion_resp(result.getString("opcion_resp"));
                respuesta.setRespuesta(result.getString("respuesta").charAt(0));
                respuesta.setRetroalimentacion(result.getString("retroalimentacion"));
                             
                respuestas.add(respuesta);
            }
            return respuestas;
        }catch(Exception e){
            int x = 1;
        }
        return respuestas;
    }
}
