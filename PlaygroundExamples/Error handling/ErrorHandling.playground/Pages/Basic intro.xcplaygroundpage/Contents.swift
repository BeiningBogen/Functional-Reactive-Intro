//: Playground - noun: a place where people can play
import UIKit

import ReactiveSwift
import ReactiveCocoa
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

let names = Signal<[String], BBError>.pipe()

names.output.observeFailed { (error) in
    
    switch error {
        
    case .noneAvailableForYourLanguage:
        print("none available for your language!")
        
    case .serverOverload:
        print("The server is overloaded")
        
    }
    
}

after(2) {

    names.input.send(value: ["Bogen", "Luke"])
    
    after(2) {
        
        names.input.send(error: BBError.serverOverload)
        
    }
    
}

PlaygroundPage.current.needsIndefiniteExecution = true








