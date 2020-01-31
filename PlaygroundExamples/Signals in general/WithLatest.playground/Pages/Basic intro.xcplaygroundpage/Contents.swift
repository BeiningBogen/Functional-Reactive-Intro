//: Playground - noun: a place where people can play

import UIKit

import ReactiveSwift
import Result


let originalSignal = Signal<String, NoError>.pipe()
let anotherSignal = Signal<String, NoError>.pipe()


// withLatest fires when self fires, if the other signal has fired at least once
// it sends the latest value of self, and the latest value of the other signal

originalSignal.output.withLatest(from: anotherSignal.output).map { value in
    
    print("withLatest fired: \(value)")
    
}



originalSignal.input.send(value: "original signal fires, nothing happens")
originalSignal.input.send(value: "original signal fires again, still nothing happens")


anotherSignal.input.send(value: "The other signal fired")

originalSignal.input.send(value: "The original signal fired again")

// nothing fires when the other signal fires again
anotherSignal.input.send(value: "The other signal the second time")
anotherSignal.input.send(value: "The other signal the third time")







