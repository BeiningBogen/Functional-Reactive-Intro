//: Playground - noun: a place where people can play

import UIKit

import Foundation

import ReactiveCocoa
import Result
import ReactiveSwift
import PlaygroundExamples
import PlaygroundSupport

var str = "Hello, playground"

let myArray = [2.0, 3.0, 4.0]

let avg = myArray.reduce(0.0) {
    return ($0 + $1) / Double(myArray.count)
}

print(avg)

struct Car {
    let color:String
    let weight:Double
    var speed:Double
}

let originalSignal = Signal<Car, NoError>.pipe()

let newSignal = originalSignal.output.map{return $0.speed}

let combined = newSignal


originalSignal.input.send(value: Car.init(color: "Blue", weight: 100.0, speed: 100.0))
originalSignal.input.send(value: Car.init(color: "Blue", weight: 100.0, speed: 80.0))
originalSignal.input.send(value: Car.init(color: "Blue", weight: 100.0, speed: 50.0))
