//
//  argumentChecker.swift
//  calc
//
//  Created by Jacob Elali (jacobelali3) on 3/25/22.
//  Copyright © 2022 UTS. All rights reserved.
//

import Foundation

struct ArgumentChecker {
    
    //Function to establish order of operations and identify arguments - except squares^ and parenthesis
    //this should check most cases without having to error handle
    func identifyString(argument: String) -> String
    {
        let number = NSCharacterSet.decimalDigits
        let symbols = NSCharacterSet.symbols
   
        var containsNumbers: Bool = false
        var containsSymbols: Bool = false
     
        if(argument.rangeOfCharacter(from: number) != nil)  { containsNumbers = true }
        if(argument.rangeOfCharacter(from: symbols) != nil)  { containsSymbols = true }
    
        if(argument == "x" || argument == "/" || argument == "%")  { return "firstOperator" }
        if(argument == "-" || argument == "+")  { return "secondOperator" }
        if(containsNumbers && !containsSymbols )  { return "number" }
        if(containsNumbers && containsSymbols  )  { return "number" }
        
      
        
        return "invalid"
    }
    
    //Function to check numbers coming in. For each number coming in, returns false if they are out of bounds
    func checkBounds(args: [String]) -> Bool
    {
        
        for i in stride(from: 0, to: args.count, by: 1) {
            if(identifyString(argument: args[i]) == "number")
            {
                if let numCheck = Int(args[i])
                {
                    if (numCheck > Int32.max || numCheck < Int32.min || numCheck > Int64.max || numCheck < Int64.min) {
            
                           return false
                       
                   }
                }
               
        }
        }
        return true
    }
    
    //Function to check if only one input, if so, return any true value eg: -52 -> -52
    func checkOneInput(args: [String]) -> String{
        if(args.count == 1 && identifyString(argument: args[0]) == "number")
        {
            var string = args[0]
            string = string.replacingOccurrences(of: "+", with: "")
            return string
        }
        return "multiple"
    }
    
    //Check for invalid expressions
    func checkInvalidExpression(args: [String]) -> Bool
    {
        if(args.count < 3 || !(identifyString(argument: args[0]) == "number") || (identifyString(argument: args[0]) == "invalid"))
        {
            return true
        }
        return false
    }
    
    //Checks every odd entry for numbers 1..3..5..etc
    func checkInvalidNumbers(args: [String]) ->String
    {
        for i in stride(from: 0, to: args.count, by: 2){
            if(!(identifyString(argument: args[i]) == "number"))
            {
                return args[i]
            }
        }
        return "valid"
    }
    
    
    //Checks every even entry for operators 2..4..5..etc
    func checkInvalidOperators(args: [String]) ->String
    {
        for i in stride(from: 1, to: args.count, by: 2){
           
            if(!(identifyString(argument: args[i]) == "firstOperator") && !(identifyString(argument: args[i]) == "secondOperator"))
            {
                return args[i]
            }
        }
       return "valid"
    }
   
    
}
