//: Playground - noun: a place where people can play

import UIKit

import ReactiveSwift
import ReactiveCocoa
import Result


let originalSignal = Signal<String, NoError>.pipe()
let anotherSignal = Signal<Int, NoError>.pipe()


// CombineLatest fires every time one of the signals fire, the prerequisite is that _BOTH_ signals have fired at least once!
// The signals do not need to be of the same type
// Whenever it fires, it gives the latest value for each of the signals

let combined = Signal.combineLatest(originalSignal.output, anotherSignal.output)

// the signal now returns Bool

combined.observeValues { (stringAndIntValue) in
    
    let stringValue = stringAndIntValue.0
    let intValue = stringAndIntValue.1
    
}


originalSignal.input.send(value: "TestString1")
originalSignal.input.send(value: "TestString2")
// not fired yet!

anotherSignal.input.send(value: 1337)
// not it fired once, with the latest values  - TestString2 and 1337












