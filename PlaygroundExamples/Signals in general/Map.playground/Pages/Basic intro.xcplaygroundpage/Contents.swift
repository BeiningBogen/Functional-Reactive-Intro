//: Playground - noun: a place where people can play

import UIKit

import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport

let originalSignal = Signal<Int, NoError>.pipe()

// Map converts from one return value to another

let array = ["first index", "second index", "third index"]

let mySignal = originalSignal.output.map{ value in
    return array[value]
}

// the signal now returns Bool

mySignal.observeValues { (value) in
    print(value)
}

originalSignal.input.send(value: 0)

after(2) {
    originalSignal.input.send(value: 1)
    
    after (2) {
        originalSignal.input.send(value: 2)
    }
}


let signal1 = Signal<Void, NoError>.pipe()
let signal2 = Signal<Int, NoError>.pipe()





PlaygroundPage.current.needsIndefiniteExecution = true
