package com.company;

public class Vehicle { String model;

    public Vehicle(String model){
        this.model = model;
    }
    public String getModel(){
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }
    public void honk(){
        System.out.println("Biibii , biibii");
        System.out.println("Biibii , biibii");
    }
}
