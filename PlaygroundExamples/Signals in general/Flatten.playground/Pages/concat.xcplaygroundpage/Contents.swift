import Foundation
import ReactiveCocoa
import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport

/*Concat*/

/*
 Credz to Eirik
 Concat only triggers when the previous stream is completed.
 */

//Imagine you are watching a live stream.
//Before you can watch it you have to watch an add.

//These are the ad and video signals
let adSignal = Signal<String, NoError>.pipe()
let liveVideoSignal = Signal<String, NoError>.pipe()

//This is the combination of ad and video
let comb = Signal<Signal<String, NoError>, NoError>.pipe()

//Here we print the values
comb.output.signal.flatten(.concat).observeValues{value in
    print(value)
}

comb.input.send(value: adSignal.output.signal)
comb.input.send(value: liveVideoSignal.output.signal)

adSignal.input.send(value: "Cheap furniture for sale!")
liveVideoSignal.input.send(value: "Video frame 1")    //This is not printed because it does not belong to the latest stream.
adSignal.input.sendCompleted()
liveVideoSignal.input.send(value: "Video frame 2")




