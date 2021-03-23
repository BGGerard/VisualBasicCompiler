/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Code;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
/**
 *
 * @author bgera
 */
public class Main {
    public static void main(String[] args) throws Exception {
        String pathFlex ="C:/Users/bgera//OneDrive/Documentos//NetBeansProjects/CompiladorVB/src/Code/Lexer.flex";
        String pathCup ="C:/Users/bgera//OneDrive/Documentos//NetBeansProjects/CompiladorVB/src/Code/LexerCup.flex";
        String[] pathsGramar = {"-parser","Gramar","C:/Users/bgera//OneDrive/Documentos//NetBeansProjects/CompiladorVB/src/Code/Gramar.cup"};
        generate(pathFlex,pathCup,pathsGramar);
    }
    public static void generate(String pathFlex, String pathCup, String[]patsGramar) throws IOException, Exception{
        
        Path pathSym = Paths.get("C:/Users/bgera//OneDrive/Documentos//NetBeansProjects/CompiladorVB/src/Code/sym.java");
        Path pathGram = Paths.get("C:/Users/bgera//OneDrive/Documentos//NetBeansProjects/CompiladorVB/src/Code/Gramar.java");
        File codigo = new File (pathFlex);
        codigo = new File (pathCup);
        JFlex.Main.generate(codigo);
        JFlex.Main.generate(codigo);
        java_cup.Main.main(patsGramar);
       
        
        if (Files.exists(pathSym)) 
            Files.delete(pathSym);
        
        Files.move(Paths.get("C:/Users/bgera//OneDrive/Documentos//NetBeansProjects/CompiladorVB/sym.java")
                ,  Paths.get("C:/Users/bgera//OneDrive/Documentos//NetBeansProjects/CompiladorVB/src/Code/sym.java")
        );
        
        if (Files.exists(pathGram)) 
            Files.delete(pathGram);
        
        Files.move(Paths.get("C:/Users/bgera//OneDrive/Documentos//NetBeansProjects/CompiladorVB/Gramar.java")
                ,  Paths.get("C:/Users/bgera//OneDrive/Documentos//NetBeansProjects/CompiladorVB/src/Code/Gramar.java")
        );
        
    }
}
