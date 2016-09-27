import XCTest
import ExpenseKit

class ExpenseKitTests: XCTestCase {
    struct Expense: ExpenseKit.Expense {
        let spent: Value
    }

    struct Budget: ExpenseKit.Budget {
        let amount: Value
        var expenses: [Expense] = []

        init(amount: Value) {
            self.amount = amount
        }
    }

    var budget: Budget!
    override func setUp() {
        budget = Budget(amount: 100)
    }

    func testCreatingBudget() {
        XCTAssertEqual(budget.spent, 0)
        XCTAssertEqual(budget.amount, 100)
        XCTAssertEqual(budget.left, 100)
    }

    func testAddingExpenses() {
        budget.expenses.append(Expense(spent: 10))
        XCTAssertEqual(budget.spent, 10)
        XCTAssertEqual(budget.amount, 100)
        XCTAssertEqual(budget.left, 90)

        budget.expenses.append(Expense(spent: 20))
        XCTAssertEqual(budget.spent, 30)
        XCTAssertEqual(budget.amount, 100)
        XCTAssertEqual(budget.left, 70)
    }

    func testPerformanceOfSpent() {
        let aLotOfExpenses = (1...2000).map { Expense(spent: Double($0)) }

        aLotOfExpenses.forEach { budget.expenses.append($0) }

        measure {
            let _ = self.budget.spent
        }
    }

    func testPerformanceOfSpentAndLeft() {
        let aLotOfExpenses = (1...2000).map { Expense(spent: Double($0)) }

        aLotOfExpenses.forEach { budget.expenses.append($0) }

        measure {
            let _ = self.budget.spent
            let _ = self.budget.left
        }
    }

    static var allTests : [(String, (ExpenseKitTests) -> () throws -> Void)] {
        return [
            ("Creating budget", testCreatingBudget),
            ("Adding expenses to budget", testAddingExpenses),
        ]
    }
}
