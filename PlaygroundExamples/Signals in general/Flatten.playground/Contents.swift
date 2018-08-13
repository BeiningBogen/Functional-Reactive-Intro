import Foundation
import ReactiveCocoa
import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport



/*Merge*/
/*
 Merge is a way to combine signals from multiple other signals.
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




/*Concat*/




/*Latest*/
/*
 Imagine a TV.
 You get signals from multiple TV channels, but you only want to display the one you are currently watching.
 */

//These are the multiple channels.
let channel1Signal = Signal<String, NoError>.pipe()
let channel2Signal = Signal<String, NoError>.pipe()

//This is the current channel, only displaying the latest signal entered.
let currentChannelSignal = Signal<Signal<String, NoError>, NoError>.pipe()

//Here we print info displayed from the channels
currentChannelSignal.output.signal.flatten(.latest).observeValues{value in
    print(value)
}

currentChannelSignal.input.send(value: channel1Signal.output.signal)    //You select channel 1
channel1Signal.input.send(value: "Welcome to channel 1")
channel1Signal.input.send(value: "Here are some news")
channel2Signal.input.send(value: "Here is some sport")  //This is not printed because it is not the latest added signal.
currentChannelSignal.input.send(value: channel2Signal.output.signal)    //You select channel 2
channel2Signal.input.send(value: "Welcome to channel 2")
channel2Signal.input.send(value: "Here is some sport")

