import Foundation

public typealias SortClosure<T> = (T, T) -> SortResult

public struct Sort<T> {
    public let closure: SortClosure<T>
    
    public init(_ closure: @escaping SortClosure<T>) {
        self.closure = closure
    }
}
