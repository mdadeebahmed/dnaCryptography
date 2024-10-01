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
public class ConvertAsciiToHexadecimal {
    public static String convertAsciiHex(String ascii){
    StringBuilder hex = new StringBuilder();
        for (int i = 0; i < ascii.length(); i++) {
            hex.append(Integer.toHexString(ascii.charAt(i)));
        }
        return hex.toString();
    }
}
