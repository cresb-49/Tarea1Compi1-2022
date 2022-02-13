package com.carlos.ejercicio2compi1;
import java.util.ArrayList;

/**
* This class is a simple example lexer.
*/
%%
%class Lexer
%unicode
%public
%line
%column
%int

%{
    private ArrayList<NumerosEntero> numerosEnteros = new ArrayList<>();
    private int vocalCont = 0;
    private int vocal1 = 0;
    private int vocal2 = 0;
    private int vocal3 = 0;
    private int vocal4 = 0;
    private int vocal5 = 0;
    
    public int getVocal1() {
        return vocal1;
    }

    public int getVocal2() {
        return vocal2;
    }

    public int getVocal3() {
        return vocal3;
    }

    public int getVocal4() {
        return vocal4;
    }

    public int getVocal5() {
        return vocal5;
    }

    public void countWord(int vocalCont) {
        
        switch (vocalCont) {
            case 1 -> {
                this.vocal1++;
            }
            case 2 -> {
                this.vocal2++;
            }
            case 3 -> {
                this.vocal3++;
            }
            case 4 -> {
                this.vocal4++;
            }
            case 5 -> {
                this.vocal5++;
            }
            default -> {
                System.out.println("Cantidad de vocales sin interes");
            }
        }
        this.vocalCont = 0;
    }
    
    private void agregarEntero(NumerosEntero entero){
        this.numerosEnteros.add(entero);
        
    }
    
    public void reiniciarLista(){
        this.numerosEnteros.clear();
    }

    public ArrayList<NumerosEntero> getNumerosEnteros() {
        return numerosEnteros;
    }

    public void resetCount(){
        this.vocal1=0;
        this.vocal2=0;
        this.vocal3=0;
        this.vocal4=0;
        this.vocal5=0;
        this.vocalCont=0;
    }

%}

LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]

vocal = [AEIOUaeiou]
consonant = [QWRTYPSDFGHJKLÑZXCVBNMqwrtypsdfghjklñzxcvbnm]
consonants = {consonant}+
number = [0-9]
numbers = {number}+
noword = [^\w]

%state WORD

%%

<YYINITIAL> {
    
    {vocal}                         {   
                                        vocalCont++;
                                        yybegin(WORD);
                                        System.out.println("Inicio vocal");
                                    }

    {consonant}                     {
                                        yybegin(WORD);
                                        System.out.println("Inicio consonante");
                                    }

    {numbers}                        {
                                        yybegin(WORD);
                                        System.out.println("Inicio numero");
                                        System.out.println(yytext());
                                        System.out.println("Linea: "+yyline+1+" ,Columna: "+yycolumn);
                                        this.agregarEntero(new NumerosEntero(yytext(), yyline+1, yycolumn));
                                    }

    /* whitespace */
    {WhiteSpace}                   { /* ignore */ }
}

<WORD> {
    <<EOF>>                         {
                                        yybegin(YYINITIAL);
                                        this.countWord(this.vocalCont);
                                        System.out.println("\""+yytext()+"\"");
                                    }

    {noword}                        {
                                        yybegin(YYINITIAL);
                                        this.countWord(this.vocalCont);
                                        System.out.println("\""+yytext()+"\"");
                                    }

    {vocal}                         { 
                                        vocalCont++;
                                        System.out.println(yytext());
                                    }
    {consonants}                    { 
                                        /* ignore */ 
                                        System.out.println(yytext());
                                    }
    {numbers}                       { 
                                        /* ignore */ 
                                        System.out.println(yytext());
                                        System.out.println("Linea: "+yyline+1+" ,Columna: "+yycolumn);
                                        this.agregarEntero(new NumerosEntero(yytext(), yyline+1, yycolumn));
                                    }
}

/* error fallback */
[^]                                     { 
                                            System.out.println("Simbolo Ilegal: "+yytext()); 
                                        }