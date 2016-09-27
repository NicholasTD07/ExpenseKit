# ExpenseKit

[![Build Status](https://travis-ci.org/NicholasTD07/ExpenseKit.svg?branch=master)](https://travis-ci.org/NicholasTD07/ExpenseKit)
[![codecov](https://codecov.io/gh/NicholasTD07/ExpenseKit/branch/master/graph/badge.svg)](https://codecov.io/gh/NicholasTD07/ExpenseKit)


Protocol oriented kit for managing expense and budget in Swift 3

## Example Usage

```swift
typealias Value = Double

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

var budget = Budget(amount: 100) // amount: 100, spent: 0, left: 100

budget.expenses.append(Expense(spent: 10)) // amount: 100, spent: 10, left: 90

budget.expenses.append(Expense(spent: 20)) // amount: 100, spent: 30, left: 70
```

## License

ExpenseKit is licensed under MIT license.
