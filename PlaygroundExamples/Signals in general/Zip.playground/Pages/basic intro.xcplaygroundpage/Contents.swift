import Foundation
import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport

/*
 Zip combines two signals and is triggerd when both signals have received values.
 This happends in a syncronized pair fashion, e.g. the third element of signal a matches the third element of signal b.
 */

let tempratureValueSignal = Signal<Int, NoError>.pipe()
let temprateLocationSignal = Signal<String, NoError>.pipe()

let tempratureObserver = Signal.zip(tempratureValueSignal.output.signal, temprateLocationSignal.output.signal)

tempratureObserver.observeValues{(value, location) in
    print("I \(location) er det \(value) grader.")
}

tempratureValueSignal.input.send(value: 20)
tempratureValueSignal.input.send(value: 40)
temprateLocationSignal.input.send(value: "Oslo")
temprateLocationSignal.input.send(value: "Kairo")
temprateLocationSignal.input.send(value: "Moskva")  //This statement is never executed because it fires only when two values are available.

/*
 Note that Oslo is paired up with 20 becuase zip combiens pairs, not the last emitted value.
 */

PlaygroundPage.current.needsIndefiniteExecution = true
