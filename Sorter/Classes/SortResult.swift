import Foundation

public enum SortResult {
    case equal(forcedResult: Bool)
    case notEqual(Bool)
    
    public init<O: SortOperatorProtocol>(lhs: O.Object, is f: O, rhs: O.Object) {
        let forcedResult = f.closure(lhs, rhs)
        
        if lhs == rhs {
            self = .equal(forcedResult: forcedResult)
        } else {
            self = .notEqual(forcedResult)
        }
    }
    
    public var isEqual: Bool {
        switch self {
            case .notEqual(_): return false
            case .equal(_): return true
        }
    }
    
    public var boolValue: Bool {
        switch self {
            case .notEqual(let result): return result
            case .equal(forcedResult: let forcedResult): return forcedResult
        }
    }
}
