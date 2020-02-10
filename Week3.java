package com.company;

import java.util.ArrayList;
import java.util.HashMap;

public class Week3 {
    public static void main(String[] args) {
//        //arrays in java
////        // assigning a variable to a list of integers in Java
////        int Values[]={2,3,12,3,23};
////        System.out.println(Values[1]);
//        //creating an empty list with a given limit to be populated later
//        int[] prices=new int[10];
//        String[] names={"Chronix","Kigali","Africa"};
//        System.out.println(names[1]);
//        //looping through an array
//        for (int i =0; i<names.length;i++){
//            System.out.println(names[i]);
//        }
//        //changing an assigned value in an array
//        names[1]= "Agnes";
//
//        System.out.println("Print after change");
//        for (int i =0; i<names.length;i++) {
//            System.out.println(names[i]);
//        }
//        //populating an empty created list
//
//        prices[0]= 50;
//        System.out.println(prices[1]);
//
//        int values[]={3,12,23};
//        int sum=0;
//        for (int i =0; i<values.length;i++){
//            sum=sum+values[i];
//        }
//       double average=sum/values.length;
//        System.out.println(average);



//        //ArrayLists in Java
//        ArrayList<String> giants = new ArrayList<String>();
//        giants.add("Rihanna Robbin Fenty");
//        giants.add("YaLevis Delware");
//        giants.add("Burna Boy");
//        for ( int i=0; i<giants.size(); i++){
//            System.out.println(giants.get(i));
//        }
//        // removing an element from array list
//        giants.remove(2);
//        for ( int i=0; i<giants.size(); i++) {
//            System.out.println(giants.get(i));
//        }
//        //changing an element from array list
//        giants.set(0 ,"Beyonce");
//        for ( int i=0; i<giants.size(); i++) {
//            System.out.println(giants.get(i));
//        }
//        //exercise
//        ArrayList<String> countries = new ArrayList<String>();
//        countries.add("Alabama");
//        countries.add("Japan");
//        countries.add("England");
//        System.out.println(countries.get(1));


        //HashMap in Java

        HashMap<String,String> capitalCities = new HashMap<String, String>();
        // adding keys and values
        capitalCities.put("Ghana","Accra");
        capitalCities.put("Rwanda","Kigali");
        capitalCities.put("South Africa","Freetown");
        //use get method to access variables
        String ghanaCapital=capitalCities.get("Ghana");
        System.out.println("The capital city of Ghana is "+ ghanaCapital);

        // using the remove method to remove a pair
        capitalCities.remove("Ghana");
        //looping through the keys,
        for (String country : capitalCities.keySet() ){
            System.out.println(country);
        }
        //looping through values
        for (String cities : capitalCities.values() ) {
            System.out.println(cities);
        }
        //looping through keys to get values
        for (String i :capitalCities.keySet()){
            System.out.println("key: "+i+" value: "+capitalCities.get(i));
        }
        //exercise
        


    }
}
