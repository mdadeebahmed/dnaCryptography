/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dna.ecryption;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author GKV
 */
public class ConvertStringToAscii {
   public static String intString=null;
    public static String convertToAscii(String in){
        try{
         List<Integer> ascii = new ArrayList<>();

    for (char c : in.toCharArray()) {
        ascii.add((int) c);
         intString= String.format("%08d", Integer.parseInt(Integer.toBinaryString((int) c)));
        System.out.println(intString);
    }

    }catch(Exception e){
        System.out.println(e);
        
    }
  return intString;
    }
}
