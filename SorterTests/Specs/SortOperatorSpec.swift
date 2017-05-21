import Quick
import Nimble
@testable import Sorter

internal final class SortOperatorSpec: QuickSpec {
    internal override func spec() {
        describe("SortOperator") {
            describe("it's closure") {
                var closure: ((Int, Int) -> Bool)!
                
                context("when lessThan") {
                    beforeEach {
                        closure = SortOperator<Int>.lessThan.closure
                    }
                    
                    it("should return a closure which returns true when lhs is less than rhs") {
                        expect(closure(1, 2)).to(beTrue())
                    }
                    
                    it("should return a closure which returns false when lhs is greater than rhs") {
                        expect(closure(2, 1)).to(beFalse())
                    }
                    
                    it("should return a closure which returns false when lhs is equal to rhs") {
                        expect(closure(1, 1)).to(beFalse())
                    }
                }
                
                context("when greaterThan") {
                    beforeEach {
                        closure = SortOperator<Int>.greaterThan.closure
                    }
                    
                    it("should return a closure which returns false when lhs is less than rhs") {
                        expect(closure(1, 2)).to(beFalse())
                    }
                    
                    it("should return a closure which returns true when lhs is greater than rhs") {
                        expect(closure(2, 1)).to(beTrue())
                    }
                    
                    it("should return a closure which returns false when lhs is equal to rhs") {
                        expect(closure(1, 1)).to(beFalse())
                    }
                }
            }
            
            describe("it's lessThan free function") {
                var result: SortResult!
                
                beforeEach {
                    result = 1 < 2
                }
                
                it("should return the correct sort result for the given inputs") {
                    expect(result) == .notEqual(true)
                }
            }
            
            describe("it's greaterThan free function") {
                var result: SortResult!
                
                beforeEach {
                    result = 1 > 2
                }
                
                it("should return the correct sort result for the given inputs") {
                    expect(result) == .notEqual(false)
                }
            }
        }
    }
}
