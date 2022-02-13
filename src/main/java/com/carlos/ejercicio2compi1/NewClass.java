/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.carlos.ejercicio2compi1;

import java.util.ArrayList;

/**
 *
 * @author carlo
 */
public class NewClass {

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
    
    private void reiniciarLista(){
        this.numerosEnteros.clear();
    }

    public ArrayList<NumerosEntero> getNumerosEnteros() {
        return numerosEnteros;
    }
    
    

}
