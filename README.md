[![Build Status](https://travis-ci.org/Noobish1/Sorter.svg?branch=master)](https://travis-ci.org/Noobish1/Sorter) [![codebeat badge](https://codebeat.co/badges/501337f1-5d15-4864-b809-7c92f61a3d99)](https://codebeat.co/projects/github-com-noobish1-sorter-master) [![codecov](https://codecov.io/gh/Noobish1/Sorter/branch/master/graph/badge.svg)](https://codecov.io/gh/Noobish1/Sorter)

# Sorter
A concept for sorting in Swift.

## Example

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
 
## Built in operators

There are a few built in operators that come with Sorter.

```swift
public enum SortOperator<T: Comparable>: SortOperatorProtocol {
    case lessThan
    case greaterThan
    
    public var closure: ((T, T) -> Bool) {
        switch self {
            case .lessThan: return { $0 < $1 }
            case .greaterThan: return { $0 > $1 }
        }
    }
}

public func < <T: Comparable>(lhs: T, rhs: T) -> SortResult {
    return SortResult(lhs: lhs, is: SortOperator.lessThan, rhs: rhs)
}

public func > <T: Comparable>(lhs: T, rhs: T) -> SortResult {
    return SortResult(lhs: lhs, is: SortOperator.greaterThan, rhs: rhs)
}
```

Defining your own is as easy as conforming to the `SortOperatorProtocol`
```swift
public protocol SortOperatorProtocol {
    associatedtype Object: Comparable
    
    var closure: (Object, Object) -> Bool { get }
}
```
