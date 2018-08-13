import Foundation
import ReactiveCocoa
import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport



/*Merge*/

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

