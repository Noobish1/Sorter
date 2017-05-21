[![Build Status](https://travis-ci.org/Noobish1/Sorter.svg?branch=master)](https://travis-ci.org/Noobish1/Sorter) [![codebeat badge](https://codebeat.co/badges/501337f1-5d15-4864-b809-7c92f61a3d99)](https://codebeat.co/projects/github-com-noobish1-sorter-master) [![codecov](https://codecov.io/gh/Noobish1/Sorter/branch/master/graph/badge.svg)](https://codecov.io/gh/Noobish1/Sorter)

# Sorter
A concept for sorting in Swift.

# Example

```swift
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
// [mcdonalds, kfc, tacobell]
```
