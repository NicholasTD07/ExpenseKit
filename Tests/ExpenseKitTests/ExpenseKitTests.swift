import XCTest
import ExpenseKit

class ExpenseKitTests: XCTestCase {
    struct Expense: ExpenseType {
        let spent: Value
    }

    struct Budget: BudgetType {
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


    static var allTests : [(String, (ExpenseKitTests) -> () throws -> Void)] {
        return [
            ("Creating budget", testCreatingBudget),
            ("Adding expenses to budget", testAddingExpenses),
        ]
    }
}
