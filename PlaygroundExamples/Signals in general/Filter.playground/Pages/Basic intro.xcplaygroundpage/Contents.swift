import Foundation
import ReactiveSwift
import ReactiveCocoa
import Result

// Filter removes entries based on a condition.
let citySignal = Signal<String, NoError>.pipe()

//In this case we remove empty strings.
let nonEmptyCitySignal = citySignal.output.filter{ text in
    text != ""  //Only let text that is not empty pass through.
}

nonEmptyCitySignal.observeValues { (text) in
    print(text)
}

//These are not printed because they are empty.
citySignal.input.send(value: "")
citySignal.input.send(value: "")

//These are printed because they are not empty.
citySignal.input.send(value: "Oslo")
citySignal.input.send(value: "Kairo")
citySignal.input.send(value: "Stockholm")
