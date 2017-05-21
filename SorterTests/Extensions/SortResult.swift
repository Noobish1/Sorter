import Foundation
import Sorter

extension SortResult: Equatable {
    public static func == (lhs: SortResult, rhs: SortResult) -> Bool {
        switch lhs {
            case .equal(forcedResult: let lhsForcedResult):
                switch rhs {
                    case .equal(forcedResult: let rhsForcedResult):
                        return lhsForcedResult == rhsForcedResult
                    default:
                        return false
                }
            case .notEqual(let lhsResult):
                switch rhs {
                    case .notEqual(let rhsResult):
                        return lhsResult == rhsResult
                    default:
                        return false
                }
        }
    }
}
