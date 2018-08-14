import Foundation
import ReactiveCocoa
import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport

/*
 Merge is a way to combine signals from multiple signals.
 It simply forwards the last emitted value regardless of which signal sends it.
 */

//Imagine we have multiple weather stations sending information about the most recent temprature.
//We can show the most recent of both of these by using the merge attribute.

//These are the weather stations
let weatherStation1 = Signal<Int, NoError>.pipe()
let weatherStation2 = Signal<Int, NoError>.pipe()

//This is the combined weather distributor
let currentTempratureSignal = Signal<Signal<Int, NoError>, NoError>.pipe()

//Here we print the most recent temprature
currentTempratureSignal.output.signal.flatten(.merge).observeValues{temprature in
    print(temprature)
}

currentTempratureSignal.input.send(value: weatherStation1.output.signal)
currentTempratureSignal.input.send(value: weatherStation2.output.signal)

//All values are printed because both weather stations are registered in current temprature
weatherStation1.input.send(value: 10)
weatherStation2.input.send(value: 12)
weatherStation1.input.send(value: 13)
