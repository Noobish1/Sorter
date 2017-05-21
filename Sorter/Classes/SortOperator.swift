import Foundation

public protocol SortOperatorProtocol {
    associatedtype Object: Comparable
    
    var closure: (Object, Object) -> Bool { get }
}

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
