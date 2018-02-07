//: Playground - noun: a place where people can play

import UIKit

import ReactiveSwift
import ReactiveCocoa
import Result
enum AnError {
    
}


let stringSignal = Signal<String, NoError>.pipe()


// Map converts from one return value to another
var numberOfTimesFired = 0


stringSignal.output.materialize().observe { (action) in
    
    numberOfTimesFired += 1
    
    print("the action is: \(action), times fired: \(numberOfTimesFired)")

}


//newSignal.observeValues { (value) in
//    print(value)
//}


stringSignal.input.send(value: "testValue")
stringSignal.input.send(value: "testValue 2")
stringSignal.input.sendInterrupted()









