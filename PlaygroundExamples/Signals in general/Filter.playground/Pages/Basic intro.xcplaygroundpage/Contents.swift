import Foundation
import ReactiveSwift
import ReactiveCocoa
import Result

// Filter removes entries based on a condition.
let originalSignal = Signal<String, NoError>.pipe()

//In this case we remove empty strings.
let newSignal = originalSignal.output.filter{ text in
    text != ""  //Only let text that are not empty pass through
}

newSignal.observeValues { (value) in
    print(value)
}

originalSignal.input.send(value: "")
originalSignal.input.send(value: "")
originalSignal.input.send(value: "testValue")
originalSignal.input.send(value: "testValue 2")
originalSignal.input.send(value: "myString")
