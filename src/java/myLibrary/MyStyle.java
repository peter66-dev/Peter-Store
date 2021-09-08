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
        if (!(str == null || str.isEmpty())) {
            return str;
        }
        str = str.toLowerCase();
        return str.substring(0, 1).toUpperCase() + str.substring(1);
    }

    public static String toTitleCase(String str) {
        char[] strChars = str.toCharArray();
        for (int i = 0; i < strChars.length - 1; i++) {
            if (strChars[i] == ' ') {
                strChars[i + 1] = Character.toUpperCase(strChars[i + 1]);
            }
        }
        return String.valueOf(strChars);
    }

}
