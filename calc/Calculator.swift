//
//  Calculator.swift
//  calc
//
//  Created by Jacob Elali (jacobelali3) on 3/25/22.
//  Copyright © 2022 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    private var arguments : [String]
    private var argumentChecker = ArgumentChecker()
    
    //initialize
    init(arguments : [String]){
        self.arguments = arguments
    }
    
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    func subtract(no1: Int, no2: Int) ->Int{
        return no1 - no2;
    }
    func multiply(no1: Int, no2: Int) ->Int{
        return no1 * no2;
    }
    func divide(no1: Int, no2: Int) ->Int{
        return no1 / no2;
    }
    func mod(no1: Int, no2: Int) -> Int{
        return no1 % no2;
    }
    
    
    
    func calculate(args: [String]) -> String {
        
        //Check for integer overflow
        if(!self.argumentChecker.checkBounds(args: args))
        {
            Exceptions(errorMessage: "Int Overflow").badIntegerError()
        }
        
        //Checks for single input
        if(!(self.argumentChecker.checkOneInput(args: args) == "multiple") )
        {
            return self.argumentChecker.checkOneInput(args: args)
        }
        
        //Checks for invalid expression
        if(self.argumentChecker.checkInvalidExpression(args: args))
        {
            Exceptions(errorMessage: "").expressionError()
        }
        
        //Check for invalid operators and numbers
        if(!(self.argumentChecker.checkInvalidNumbers(args: args) == "valid") )
        {
            Exceptions(errorMessage: (self.argumentChecker.checkInvalidNumbers(args: args))).numberError()
        }
        if(!(self.argumentChecker.checkInvalidOperators(args: args) == "valid") )
        {
            Exceptions(errorMessage: (self.argumentChecker.checkInvalidNumbers(args: args))).badOperatorError()
        }
        
        var num1: Int = 0;
        var num2: Int = 0;
        var num3: Int = 0;
        var tempArray: [String] = args;
        var i: Int = -1;
        while( i < tempArray.count){
        
            if( i != tempArray.count) {
                i += 1
            }
          
            if(i != 0 )
            {
                num1 = Int(tempArray[i-1]) ?? 0
            }
            if(i < tempArray.count-1)
            {
            
                num2 = Int(tempArray[i+1]) ?? 0
            }
            
            if((self.argumentChecker.identifyString(argument: tempArray[i]) == "firstOperator"))
            {
                switch tempArray[i]{
                case "x":
                    num3 = multiply(no1: num1, no2: num2)
                    tempArray[i-1] = String(num3)
                    tempArray.remove(at: i+1)
                    tempArray.remove(at: i)
                    
                    if(tempArray.count == 1) { return tempArray[0] }
                    i -= 1
                case "/":
                    if(num2 == 0) {
                        Exceptions(errorMessage: "").divideZeroError()
                    }
                    num3 = divide(no1: num1, no2: num2)
                    tempArray[i-1] = String(num3)
                    tempArray.remove(at: i+1)
                    tempArray.remove(at: i)
                    
                    if(tempArray.count == 1) { return tempArray[0] }
                    i -= 1
                    
                case "%":
                    if(num2 == 0) {
                        Exceptions(errorMessage: "").modZeroError()
                    }
                    num3 = mod(no1: num1, no2: num2)
                    tempArray[i-1] = String(num3)
                    tempArray.remove(at: i+1)
                    tempArray.remove(at: i)
                   
                    if(tempArray.count == 1) { return tempArray[0] }
                    i -= 1
                    
                default: continue
                }
             
            }
            if((self.argumentChecker.identifyString(argument: tempArray[i]) == "secondOperator"))
            {
                switch tempArray[i]{
                case "-":
                    num3 = subtract(no1: num1, no2: num2)
                    tempArray[i-1] = String(num3)
                    tempArray.remove(at: i+1)
                    tempArray.remove(at: i)
                
                    if(tempArray.count == 1) { return tempArray[0] }
                    i -= 1
                case "+":
                    num3 = add(no1: num1, no2: num2)
                    tempArray[i-1] = String(num3)
                    tempArray.remove(at: i+1)
                    tempArray.remove(at: i)
                
                    if(tempArray.count == 1) { return tempArray[0] }
                    i -= 1
                    
                default: continue
                }
            }
        }
     
            
    
        return "0000"
       
 }

}
