//
//  main.swift
//  calc
//
//  Created by Jacob Elali (jacobelali3) on 3/25/22.
//  Copyright © 2022 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

//var list: [String] = [ "922337203685477580790"]
// Initialize a Calculator object
let calculator = Calculator(arguments: args).calculate(args: args)
//let calculator = Calculator(arguments: args).calculate(args: list)
print(calculator)
