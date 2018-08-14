//: Playground - noun: a place where people can play

import UIKit

import ReactiveSwift
import ReactiveCocoa
import Result

/*
 Scan begins with an initial value.
 It then combines the previous value with the last emitted value.
 */

/*
 Let us say that you receive weather reports from a weather station and you want to combine these values into a csv file.
 */

let weatherStationSignal = Signal<String, NoError>.pipe()

let initialValue = "{location: Oslo, temprature: null}"

let csvFileSignal = weatherStationSignal.output.scan(initialValue){ combinedValue, newValue in
    "\(combinedValue),\(newValue)"
}

csvFileSignal.observeValues{number in
    print(number)
}

weatherStationSignal.input.send(value: "{location: Oslo, temprature: 14}")
weatherStationSignal.input.send(value: "{location: Bergen, temprature: 10}")
weatherStationSignal.input.send(value: "{location: Trondheim, temprature: 5}")
weatherStationSignal.input.send(value: "{location: Tønsberg, temprature: 19}")
