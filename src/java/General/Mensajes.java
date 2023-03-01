/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

/**
 *
 * @author jotaz
 */
public class Mensajes {
    public String GetErrorMessage(int errorNumber){
        if(errorNumber == 10){
            return "Hubo un error al intentar crear los registro de articulo";
        }else if(errorNumber == 11){
            return "Hubo un error al intentar borrar el articulo";
        }
        return "";
    }
    
     public String GetSuccessMessage(int number){
        if(number == 10){
            return "Se ha registrado el articulo correctamente";
        }else if(number == 11){
            return "Se ha eliminado el articulo correctamente";
        }
        return "";
    }
}
