//: Playground - noun: a place where people can play

import UIKit


import ReactiveCocoa
import Result
import ReactiveSwift

let originalSignal = Signal<String, NoError>.pipe()


// Map converts from one return value to another

let newSignal = originalSignal.output.map { string -> Bool in
    
    if string == "myString" {
        return true
    }
    return false
}

// the signal now returns Bool

newSignal.observeValues { (value) in
    print(value)
}


originalSignal.input.send(value: "testValue")
originalSignal.input.send(value: "testValue 2")
originalSignal.input.send(value: "myString")








