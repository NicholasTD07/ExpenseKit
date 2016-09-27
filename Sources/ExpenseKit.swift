public typealias Value = Double

public protocol ExpenseType {
    var spent: Value { get }
}

public protocol BudgetType {
    associatedtype Expense
    var amount: Value { get }
    var expenses: [Expense] { get }
}

public extension BudgetType where Self.Expense: ExpenseType {
    var spent: Value {
        return expenses.reduce(0) { sum, expense in sum + expense.spent  }
    }

    var left: Value {
        return amount - spent
    }
}
