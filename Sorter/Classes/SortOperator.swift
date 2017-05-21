import Foundation

public enum SortOperator<T: Comparable> {
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
    return SortResult(lhs: lhs, is: .lessThan, rhs: rhs)
}

public func > <T: Comparable>(lhs: T, rhs: T) -> SortResult {
    return SortResult(lhs: lhs, is: .greaterThan, rhs: rhs)
}
