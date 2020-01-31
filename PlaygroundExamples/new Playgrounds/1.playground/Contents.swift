import Foundation
import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport

/*Let us say you have a button which is represented using a void signal*/
let buttonSignal = Signal<Void, NoError>.pipe()
/*Each time the button is pressed it emits a void value*/

/*Additionally you want to get a value from another signal which is continously updated.
 This is represented using a signal pushing strings*/
let textSignal = Signal<String?, NoError>.pipe()

/*You want to print the string every time the button is tapped*/
let displayTextWhenButtonIsPressedSignal =
    Signal.combineLatest(   //Combine button and text signal
        buttonSignal.output.signal,
        textSignal.output.signal)
        .sample(on: buttonSignal.output.signal) //Sample both on button signal, e.g. it only triggers when the button is tapped
        .map{ (tapped, text) in //Finally retrive the text using map
    print(text)
}

textSignal.input.send(value: "test1") //This is not printed because button was not pressed
textSignal.input.send(value: "test2")
buttonSignal.input.send(value: ())
buttonSignal.input.send(value: ())  //test2 is printed twice because button was pressed twice
