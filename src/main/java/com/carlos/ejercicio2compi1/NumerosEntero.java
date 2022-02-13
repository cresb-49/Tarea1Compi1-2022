package com.carlos.ejercicio2compi1;

/**
 *
 * @author carlo
 */
public class NumerosEntero {
    private String numero;
    private int line;
    private int column;

    public NumerosEntero(String numero, int line, int column) {
        this.numero = numero;
        this.line = line;
        this.column = column;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public int getLine() {
        return line;
    }

    public void setLine(int line) {
        this.line = line;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    @Override
    public String toString() {
        return "NumerosEntero{" + "numero=" + numero + ", line=" + line + ", column=" + column + '}';
    }
}
