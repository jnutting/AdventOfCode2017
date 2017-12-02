import Foundation

public func sumOfEvenlyDivisibles(_ allRows: String) -> Int {
    let rows = allRows.split(separator: "\n")
    var sum = 0

    for row in rows {
        sum += hiddenDivisorInRow(row)
    }

    return sum
}

func hiddenDivisorInRow<S: StringProtocol>(_ row: S) -> Int {
    let numberStrings = row.split(separator: " ")
    let numbers = numberStrings.flatMap { Int(String($0)) }.sorted { $0 > $1 }
    for (bigIndex, bigValue) in numbers.enumerated() {
        let nextIndex = bigIndex + 1
        let remaining = numbers[nextIndex...]
        for (smallIndex, smallValue) in remaining.enumerated() {
            if bigValue % smallValue == 0 {
                return bigValue / smallValue
            }
        }
    }
    return 0
}
