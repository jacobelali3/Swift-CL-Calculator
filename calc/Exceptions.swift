//
//  Exceptions.swift
//  calc
//
//  Created by Jacob Elali (jacobelali3) on 3/25/22.
//  Copyright © 2022 UTS. All rights reserved.
//
//
import Foundation

//Exceptions each with their own response and error message
struct Exceptions {
    
    var errorMessage: String
    
    enum errorType: Error {
        
        case divideZeroError
        case numberError
        case badOperatorError
        case expressionError
        case badIntegerError
        case modZeroError
    
    }
    
    func divideZeroError() {
        do {
            throw errorType.divideZeroError
        } catch {
            print("Division by zero")
            exit(99)
        }
    }
    
    func modZeroError() {
        do {
            throw errorType.modZeroError
        } catch {
            print("Mod by zero")
            exit(99)
        }
    }

   
    func numberError() {
        do {
            throw errorType.numberError
        } catch {
            print("Invalid number: \(errorMessage)")
            exit(98)
        }
    }
    
    func badIntegerError() {
        do {
            throw errorType.badIntegerError
        } catch {
            print("Please use a valid Integer. Error: \(errorMessage)")
            exit(97)
        }
    }
    
    func expressionError() {
        do {
            throw errorType.expressionError
        } catch {
            print("Incomplete expression. Expected input of the form [number] [operator number ...]")
            exit(95)
        }
    }
    
    func badOperatorError() {
        do {
            throw errorType.badOperatorError
        } catch {
            print("Unknown operator: \(errorMessage)")
            exit(96)
        }
    }
    
    
}
