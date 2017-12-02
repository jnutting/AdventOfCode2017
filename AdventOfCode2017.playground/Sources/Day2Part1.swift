import Foundation

public func checkSum(_ allRows: String) -> Int {
    let rows = allRows.split(separator: "\n")
    var checkSum = 0

    for row in rows {
        checkSum += spreadForRow(row)
    }
    
    return checkSum
}

func spreadForRow<S: StringProtocol>(_ row: S) -> Int {
    let numbers = row.split(separator: " ")

    if numbers.count < 0 { return 0}

    var smallest = Int.max
    var largest = 0

    for numberString in numbers {
        guard let number = Int(String(numberString)) else {
            continue
        }
        if number > largest { largest = number }
        if number < smallest { smallest = number }
    }

    return largest - smallest
}
