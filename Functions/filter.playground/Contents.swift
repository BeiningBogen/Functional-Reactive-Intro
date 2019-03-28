import Foundation

/*
 Aaah Filter(), you beautiful thing you :)
 
 When you filter on a collection, the result will be the same elements in the same order except for the ones that don't satisfy the predicate (i.e. your filter criteria)
 
 Here we will see how to use filter() on an array that contains hashes, each representing a pet.
 Each item in the hash will have a name, and age, and a type.
 */

struct Pet {
    let name: String
    let age: Int
    let colour: String
    let type: String
}


let petList = [
    Pet(name: "Bacon", age: 4, colour: "brown", type: "dog"),
    Pet(name: "Oscar", age: 2, colour: "black", type: "cat"),
    Pet(name: "Rex", age: 1, colour: "brown", type: "hamster"),
    Pet(name: "Waffles", age: 1, colour: "Black", type: "dog"),
    Pet(name: "Misty", age: 6, colour: "white", type: "cat"),
    Pet(name: "Pepper", age: 1, colour: "white", type: "hamster"),
    Pet(name: "Simba", age: 4, colour: "grey", type: "cat"),
    Pet(name: "Lola", age: 12, colour: "white", type: "dog"),
    Pet(name: "Duke", age: 9, colour: "grey", type: "dog"),
    Pet(name: "Max", age: 2, colour: "green", type: "bird"),
    Pet(name: "Mushu", age: 530, colour: "purple", type: "dragon"),
    Pet(name: "Skittles", age: 1, colour: "blue", type: "bird"),
    Pet(name: "Bugs", age: 1, colour: "white", type: "rabbit"),
]


/*
 Now, if we wanted to get only pets that are dogs, we would traditionally do something like this
 */

var dogList: [Pet] = []
for pet in petList {
    if pet.type == "dog" {
        dogList.append(pet)
    }
}

dogList

/*
 An easier (and much shorter) way for us to do something like this would be using the filter function.
 
 Note that the $0 refers to the current item in the array.
 So for the first iteration, the $0 would be the first pet, and the second iteration would be the second pet, and so on...
 */

dogList = petList.filter { $0.type == "dog" }

dogList

/*
 Similarly, the filter function can be chained.
 
 What's happening here is that the first filter returns an array of just dogs. Which is used as an input for the second filter, which just returns the dogs that are older than 5.
 */

dogList = petList
    .filter { $0.type == "dog" }
    .filter { $0.age > 5 }

dogList


/*
 EXERCISE:
 
 1: Try to display only dragons.
 2: Try to display only cats that are older than 2, and are white.
 */



/*
 ADVANCED:
 
 Let's assume that we created a few functions with criteria about pets, so for example, isDog would return true if the type of the pet is a dog, similarly, the isOld would return true if the pet's age is greater then 5.
 */


func isDog(pet: Pet) -> Bool {
    return pet.type == "dog"
}

func isOld(pet: Pet) -> Bool {
    return pet.age > 5
}

/*
 You might use these functions in the following fashion:
 */

dogList = petList
    .filter { isDog(pet: $0) }
    .filter { isOld(pet: $0) }

dogList

/*
 A more readable use of high order functions is allowing them to pass the $ parameter(s) implicitly to a function.
 */


dogList = petList
    .filter(isDog)
    .filter(isOld)

dogList

