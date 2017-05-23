/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author judah
 */
public class AsteriskVariableModel {

    private String name;
    private String value;

    public AsteriskVariableModel(String name,String value) {
        this.name=name;
        this.value=value;
    }
    
    public AsteriskVariableModel(String text) {
//        System.out.println(text);
        String aux[] = text.split("=");
        if (aux.length > 0) {
            this.name = aux[0].trim();
        }
        if (aux.length > 1) {
            this.value = aux[1];
            if(aux.length > 2){
                for (int i = 2; i < aux.length; i++) {
                    this.value +="="+ aux[i];
                    
                }
            }
        }
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public String getValue() {
        return value;
    }
}
