/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author judah
 */
public class AsteriskSessionModel {

    private String name;
    private String info;
    private List<AsteriskVariableModel> variable;

    public AsteriskSessionModel(String name,String info) {
        this.info=info;
        this.name=name;
        this.variable = new ArrayList<>();
    }
    
    public AsteriskSessionModel(String text) {
        this.name = text.substring(0, text.indexOf("]"));
        System.out.println("PartName:" + this.name +"--");
        this.variable = new ArrayList<>();

        String aux[] = text.split("\n");
        this.info=aux[0].substring(aux[0].indexOf("]"));
        if(this.info.length()<2){
            this.info="";
        }else{
            this.info=this.info.substring(this.info.indexOf("]")+1);
//            System.out.println("Info:" + this.info);
        }
        for (int index = 1; index < aux.length; index++) {
            this.variable.add(new AsteriskVariableModel(aux[index]));
        }
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setInfo(String info) {
        this.info = info;
    }
    
    public void setVariable(int i,String name,String value) {
        this.variable.get(i).setName(name);
        this.variable.get(i).setName(value);
    }
    
    public void addVariable(String name,String value) {
        this.variable.add(new AsteriskVariableModel(name, value));
    }
    
    public void removeVariable(int i) {
        this.variable.remove(i);
    }
    
    public String getName() {
        return name;
    }

    public String getInfo() {
        return info;
    }

    public List<AsteriskVariableModel> getVariableList() {
        return variable;
    }
    
    public AsteriskVariableModel getVariable(int i) {
        return variable.get(i);
    }
    
    @Override
    public String toString() {
        String str=this.name;
        str+=this.info;
        
        return str;
    }   
}
