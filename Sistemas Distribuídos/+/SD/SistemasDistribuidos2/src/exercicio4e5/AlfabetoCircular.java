
package exercicio4e5;

import java.util.ArrayList;
import java.util.List;


public class AlfabetoCircular {

    public final List<List<Character>> listasCirculares = new ArrayList<List<Character>>();

    public AlfabetoCircular(){

        char[] temp;
        List<Character> alfabeto;

        //Adiciona vogais minusculas ao alfabeto
        
        alfabeto = new ArrayList<Character>();
        temp = new char[] { 'a', 'e', 'i', 'o', 'u' };
        for (final char vogal : temp) {
            alfabeto.add(vogal);
        }
        listasCirculares.add(alfabeto);

        //Adiciona consoantes minusculas ao alfabeto
        
        alfabeto = new ArrayList<Character>();
        temp = new char[] { 'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w',
                           'x', 'y', 'z' };
        for (final char consoante : temp) {
            alfabeto.add(consoante);
        }
        listasCirculares.add(alfabeto);
        
        //Adiciona vogais maiusculas ao alfabeto
        
        alfabeto = new ArrayList<Character>();
        temp = new char[] { 'A', 'E', 'I', 'O', 'U' };
        for (final char vogal : temp) {
            alfabeto.add(vogal);
        }
        listasCirculares.add(alfabeto);

        //Adiciona consoantes maiusculas ao alfabeto
        
        alfabeto = new ArrayList<Character>();
        temp = new char[] { 'B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W',
                           'X', 'Y', 'Z' };
        for (final char consoante : temp) {
            alfabeto.add(consoante);
        }
        
        //Adiciona o alfabeto previamente estabelecido a listaCircular
        
        listasCirculares.add(alfabeto);
    }

}
