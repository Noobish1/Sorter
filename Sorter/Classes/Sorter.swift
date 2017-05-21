import Foundation

public final class Sorter {
    // MARK: Raw sort results
    public static func rawSortResult<T>(from sorts: [Sort<T>], lhs: T, rhs: T) -> Bool {
        var mutableSorts = sorts
        var sortResult = mutableSorts.removeFirst().closure(lhs, rhs)
        
        while sortResult.isEqual && !mutableSorts.isEmpty {
            sortResult = mutableSorts.removeFirst().closure(lhs, rhs)
        }
        
        return sortResult.boolValue
    }
    
    public static func rawSortResult<T>(from sortsClosures: [SortClosure<T>], lhs: T, rhs: T) -> Bool {
        return rawSortResult(from: sortsClosures.map(Sort.init), lhs: lhs, rhs: rhs)
    }
    
    // MARK: Sorting
    public static func sort<T>(objects: [T], using sortClosures: [SortClosure<T>]) -> [T] {
        return sort(objects: objects, using: sortClosures.map(Sort.init))
    }
    
    public static func sort<T>(objects: [T], using sorts: [Sort<T>]) -> [T] {
        return objects.sorted { rawSortResult(from: sorts, lhs: $0, rhs: $1) }
    }
    
    // MARK: Sort results
    public static func sortResult(from sortResults: [SortResult]) -> SortResult {
        var mutableSortResults = sortResults
        var sortResult = mutableSortResults.removeFirst()
        
        while sortResult.isEqual && !mutableSortResults.isEmpty {
            sortResult = mutableSortResults.removeFirst()
        }
        
        return sortResult
    }
}
