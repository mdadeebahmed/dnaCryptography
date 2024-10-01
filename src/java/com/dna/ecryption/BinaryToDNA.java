/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dna.ecryption;

/**
 *
 * @author GKV
 */
public class BinaryToDNA {
    public static String convert(String input) {
        StringBuilder sb=null;
    if (input.length() % 2 == 1) {
        return "Please Use Correct Number";
    }else{

     sb = new StringBuilder();

    for (int i = 0; i < input.length(); i += 2) {
        if (input.charAt(i) == '0') {
            if (input.charAt(i + 1) == '0') {
                sb.append("A");
            } else {
                sb.append("G");
            }
        } else {
            if (input.charAt(i + 1) == '0') {
                sb.append("C");
            } else {
                sb.append("T");
            }
        }
    }
    }
    return sb.toString();
}
}
