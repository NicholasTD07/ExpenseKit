public typealias Value = Double

public protocol Expense {
    var spent: Value { get }
}

public protocol Budget {
    associatedtype ExpenseType
    var amount: Value { get }
    var expenses: [ExpenseType] { get }
}

public extension Budget where Self.ExpenseType: Expense {
    var spent: Value {
        return expenses.reduce(0) { sum, expense in sum + expense.spent  }
    }

    var left: Value {
        return amount - spent
    }
}
