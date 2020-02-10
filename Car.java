package com.company;

public class Car extends Vehicle {

    public Car(String model){
        super(model);
    }

    public void startEngine(){
        System.out.println("Vroom , Vroom");
    }
}
