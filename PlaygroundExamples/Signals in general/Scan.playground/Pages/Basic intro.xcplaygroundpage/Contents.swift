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
 Let us say that you receive an average km per hour from a car every minute.
 You then want to calculate average between the previous and the new value.
 */

let carSpeedSignal = Signal<Int, NoError>.pipe()

let initialValue = 0

let carAverageSpeedSignal = carSpeedSignal.output.scan(initialValue) { averageSoFar, nextAverage in //We set the initial value to 0 so that the first avg is 0
    (averageSoFar + nextAverage) / 2    //We calculate the average of the previous average and the new average
}

carAverageSpeedSignal.observeValues{ averageSpeed in
    print("\(averageSpeed) km/h")
}

carSpeedSignal.input.send(value: 20)    //average of 0 (inital) and 20 is 10
carSpeedSignal.input.send(value: 30)    //average of 10 and 30 is 20
carSpeedSignal.input.send(value: 50)
carSpeedSignal.input.send(value: 40)
carSpeedSignal.input.send(value: 37)
