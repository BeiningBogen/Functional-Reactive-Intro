import Foundation
import ReactiveSwift
import ReactiveCocoa
import Result

//Setup initial values
let capitalSignal = Signal<String, NoError>.pipe()
let scandinavianCapitals = ["Oslo", "Copenhagen", "Stockholm", "Helsinki", "Reykjavík", "Tórshavn", "Mariehamn"]

//Filter removes entries based on a condition.
//In this case we remove capitals that are not in our Scandinavia array.
let scandinavicCapitalSignal = capitalSignal.output.filter{ capital in
    scandinavianCapitals.contains(capital) //Only let scandinavian capitals pass through.
}

//Print the capitals that met the condition defined above.
scandinavicCapitalSignal.observeValues { (capital) in
    print(capital)
}

//These are not printed because they are not in the scandinavian array.
capitalSignal.input.send(value: "Kairo")
capitalSignal.input.send(value: "Rome")

//These are printed because they are in the scandinavian array.
capitalSignal.input.send(value: "Oslo")
capitalSignal.input.send(value: "Stockholm")
