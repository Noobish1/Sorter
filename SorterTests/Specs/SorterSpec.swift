import Quick
import Nimble
@testable import Sorter

internal final class SorterSpec: QuickSpec {
    internal override func spec() {
        describe("Sorter") {
            describe("it's rawSortResult from sorts") {
                var result: Bool!
                
                beforeEach {
                    let sorts = [Sort<Int> { $0 < $1 }, Sort<Int> { $0 > $1 }]
                    result = Sorter.rawSortResult(from: sorts, lhs: 1, rhs: 1)
                }
                
                it("should return the correct value for the given inputs") {
                    expect(result).to(beFalse())
                }
            }
            
            describe("it's rawSortResult from sortsClosure") {
                var result: Bool!
                
                beforeEach {
                    let sortClosures: [SortClosure<Int>] = [{ $0 < $1 }, { $0 > $1 }]
                    result = Sorter.rawSortResult(from: sortClosures, lhs: 1, rhs: 2)
                }
                
                it("should return the correct value for the given inputs") {
                    expect(result).to(beTrue())
                }
            }
            
            describe("it's sort objects using sortClosures") {
                var result: [Int]!
                
                beforeEach {
                    let sortClosures: [SortClosure<Int>] = [{ $0 < $1 }, { $0 > $1 }]
                    result = Sorter.sort(objects: [2, 1], using: sortClosures)
                }
                
                it("should return the correct value for the given inputs") {
                    expect(result) == [1, 2]
                }
            }
            
            describe("it's sort objects using sorts") {
                var result: [Int]!
                
                beforeEach {
                    let sorts = [Sort<Int> { $0 < $1 }, Sort<Int> { $0 > $1 }]
                    result = Sorter.sort(objects: [2, 1], using: sorts)
                }
                
                it("should return the correct value for the given inputs") {
                    expect(result) == [1, 2]
                }
            }
            
            describe("it's sortResult from sortResults") {
                var actual: SortResult!
                
                beforeEach {
                    actual = Sorter.sortResult(from: [SortResult(lhs: 1, is: .lessThan, rhs: 1),
                                                      SortResult(lhs: "a", is: .lessThan, rhs: "b")])
                }
                
                it("should return the correct sortResult from the given inputs") {
                    expect(actual) == .notEqual(true)
                }
            }
        }
    }
}
