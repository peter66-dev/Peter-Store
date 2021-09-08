/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myLibrary;

/**
 *
 * @author Dell
 */
public class MyStyle {

    public static String toUpperFirstLetter(String str) {
        if (str == null || str.isEmpty()) {
            return str;
        }
        str = str.toLowerCase();
        return str.substring(0, 1).toUpperCase() + str.substring(1);
    }

    public static String toTitleCase(String phrase) {
        char[] phraseChars = phrase.toCharArray();
        for (int i = 0; i < phraseChars.length - 1; i++) {
            if (phraseChars[i] == ' ') {
                phraseChars[i + 1] = Character.toUpperCase(phraseChars[i + 1]);
            }
        }
        return String.valueOf(phraseChars);
    }

}
