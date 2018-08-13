//: [Previous](@previous)

import Foundation

import ReactiveCocoa
import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport

var str = "Hello, playground"

//: [Next](@next)

struct Car {
    let color:String
    let weight:Double
    var speed:Double
}

let originalSignal = Signal<Car, NoError>.pipe()

originalSignal.output.map{return "\($0.speed) km/h"}.observeValues{print($0)}

originalSignal.input.send(value: Car.init(color: "Blue", weight: 1000.0, speed: Double(arc4random_uniform(100))))
originalSignal.input.send(value: Car.init(color: "Blue", weight: 1000.0, speed: Double(arc4random_uniform(100))))
originalSignal.input.send(value: Car.init(color: "Blue", weight: 1000.0, speed: Double(arc4random_uniform(100))))
originalSignal.input.send(value: Car.init(color: "Blue", weight: 1000.0, speed: Double(arc4random_uniform(100))))
originalSignal.input.send(value: Car.init(color: "Blue", weight: 1000.0, speed: Double(arc4random_uniform(100))))
