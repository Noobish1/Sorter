//: Playground - noun: a place where people can play

import UIKit
import Sorter

//MARK: Example model
struct Restaurant {
    let name: String
    let rating: Float
}

//MARK: Example sorts
extension Restaurant {
    static let alphabeticalSort = Sort<Restaurant> {
        $0.name < $1.name
    }
    
    static let ratingSort = Sort<Restaurant> {
        $0.rating > $1.rating
    }
}

let mcdonalds = Restaurant(name: "McDonalds", rating: 5.5)
let tacoBell = Restaurant(name: "Taco Bell", rating: 2.5)
let kfc = Restaurant(name: "KFC", rating: 2.5)
let objects = [tacoBell, kfc, mcdonalds]
let sorts = [Restaurant.ratingSort, Restaurant.alphabeticalSort]

let sortedObjects = Sorter.sort(objects: objects, using: sorts)
