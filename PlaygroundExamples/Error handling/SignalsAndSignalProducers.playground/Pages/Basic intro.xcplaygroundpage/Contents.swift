//: Playground - noun: a place where people can play

import UIKit

import ReactiveSwift
import Result
import PlaygroundExamples
import PlaygroundSupport

// Can't get the framework thing to work yet, so this code is just pasted here!
public func after(_ duration: Double, closure: @escaping () -> Void) {
    
    let delayTime = DispatchTime.now() + Double(Int64(duration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    
    DispatchQueue.main.asyncAfter(deadline: delayTime) {
        
        closure()
        
    }
    
}

enum BBError : Error {
    
    case noneAvailableForYourLanguage
    case serverOverload
    
}

var requestShouldError = true

let simulatedWebRequest = SignalProducer<[Int], BBError> { observer, lifetime in
    
    print("simulated web request started, waiting for response")
    after(3) {
        
        if requestShouldError {
        
            observer.send(error: .serverOverload)
            
        } else {
            
            observer.send(value: [23, 30, 26, 43])

        }
        
    }
    
}

let startTakingValues = Signal<Void, NoError>.pipe()

let numberOfValues = startTakingValues.output
    .flatMap(.merge) { stuffers in
        return simulatedWebRequest.start(on: QueueScheduler())
    }.map { result in
        return result.count
}


let errorMessage = numberOfValues.map { _ in "" } // Just converts this to a signal that can return String
    .flatMapError { error -> SignalProducer<String, NoError> in   // converts the actual error to a value that can be displayed to the user

    switch error {

    case .noneAvailableForYourLanguage:
        return SignalProducer.init(value: "none available for your language!")

    case .serverOverload:
        return SignalProducer.init(value:"The server is overloaded" )

    }

}

// For some ViewModel based architectures, it might be handy to convert the signal to a signal that never errors
let valuesWithNoError = numberOfValues.flatMapError { stf -> SignalProducer<Int, NoError> in
    return SignalProducer.empty
}

// This fires every time a value is sent, guarantees only values, no errors
valuesWithNoError.observeValues { (value) in
    print("number of values: \(value)")
}

errorMessage.observeValues { value in
    print("Error message: \(value)")
}

after(1) {
    
    requestShouldError = true
    
    print("We are ready to receive values")
    startTakingValues.input.send(value: ())
    
    
}

PlaygroundPage.current.needsIndefiniteExecution = true








