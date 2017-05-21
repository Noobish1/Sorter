import Quick
import Nimble
@testable import Sorter

internal final class SortResultSpec: QuickSpec {
    internal override func spec() {
        describe("SortResult") {
            describe("it's init") {
                var forcedResult: Bool!
                var result: SortResult!
                
                context("when the lhs is equal to the rhs") {
                    beforeEach {
                        let lhs = 1
                        let rhs = 1
                        let op: SortOperator<Int> = .lessThan
                        forcedResult = op.closure(lhs, rhs)
                        result = SortResult(lhs: lhs, is: op, rhs: rhs)
                    }
                    
                    it("should return equal with the given forcedResult") {
                        expect(result) == .equal(forcedResult: forcedResult)
                    }
                }
                
                context("when the lhs does not equal the rhs") {
                    beforeEach {
                        let lhs = 1
                        let rhs = 2
                        let op: SortOperator<Int> = .lessThan
                        forcedResult = op.closure(lhs, rhs)
                        result = SortResult(lhs: lhs, is: op, rhs: rhs)
                    }
                    
                    it("should return notEqual with the given forcedResult") {
                        expect(result) == .notEqual(forcedResult)
                    }
                }
            }
            
            describe("it's isEqual") {
                var result: SortResult!
                
                context("when notEqual") {
                    beforeEach {
                       result = .notEqual(true)
                    }
                    
                    it("should return false") {
                        expect(result.isEqual).to(beFalse())
                    }
                }
                
                context("when equal") {
                    beforeEach {
                        result = .equal(forcedResult: true)
                    }
                    
                    it("should return true") {
                        expect(result.isEqual).to(beTrue())
                    }
                }
            }
            
            describe("it's boolValue") {
                var forcedResult: Bool!
                var result: SortResult!
                
                context("when notEqual") {
                    beforeEach {
                        forcedResult = true
                        result = .notEqual(forcedResult)
                    }
                    
                    it("should return the forcedResult") {
                        expect(result.boolValue) == forcedResult
                    }
                }
                
                context("when equal") {
                    beforeEach {
                        forcedResult = false
                        result = .equal(forcedResult: forcedResult)
                    }
                    
                    it("should return the forcedResult") {
                        expect(result.boolValue) == forcedResult
                    }
                }
            }
        }
    }
}
