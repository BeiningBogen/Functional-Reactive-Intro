import Foundation
import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport

let tempratureSignal1 = Signal<Int, NoError>.pipe()
let tempratureSignal2 = Signal<Int, NoError>.pipe()

/*Merge is used to combine two signals of the same type into one.
 It is completed when both of the underlying streams are completed*/

/*In this case we combine two string streams.
 If we have tempratures from multiple source and want to demultiplex them into one we can use merge.*/

let merged = Signal.merge(tempratureSignal1.output.signal, tempratureSignal2.output.signal)

merged.observeValues{temprature in
    print(temprature)
}

//Both inputs are sent
tempratureSignal1.input.send(value: 10)
tempratureSignal2.input.send(value: 12)
tempratureSignal1.input.send(value: 13)
tempratureSignal1.input.sendCompleted() //Input 1 has finished but the merged continues to send from input 2
tempratureSignal1.input.send(value: 13) //This is not transmitted because sendCompleted was executed prior to this
tempratureSignal2.input.send(value: 10) //This is transmitted because input 2 is still active
tempratureSignal2.input.sendCompleted() //The merged is now completed.
