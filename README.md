# ExpenseKit

[![Build Status](https://travis-ci.org/NicholasTD07/ExpenseKit.svg?branch=master)](https://travis-ci.org/NicholasTD07/ExpenseKit)
[![codecov](https://codecov.io/gh/NicholasTD07/ExpenseKit/branch/master/graph/badge.svg)](https://codecov.io/gh/NicholasTD07/ExpenseKit)


Protocol oriented kit for managing expense and budget in Swift 3
## Expense and Budget

ExpenseKit provides two protocols, `Expanse` and `Budget`.

`Expense` requires a `spent` instance variable, while `Budget` requires two, i.e. an `amount` and also `expenses` which is an array of "Expenses".

ExpenseKit also provides an extension on `Budget` when elements in a `Budget`'s `expenses` array conforms to `Expense` protocol.
This extension on `Budget` has two computed variables:

- `spent`, which is the sum of all the `expense`'s `spent` (money)
- `left`, which is what's left in the `budget` (`budget.amount - budget.spent`) 

### NB

As of now, all the value variables, i.e. `amount`, `spent`, and `left` are of type `Value` which is an typealias for `Double`.

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
