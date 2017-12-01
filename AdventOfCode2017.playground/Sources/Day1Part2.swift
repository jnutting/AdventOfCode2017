import Foundation

// This is designed to step through the `in` parameter
// by incrementally indexing its way through both halves.
public func sumOfAllDigitsMatchingDigitHalfwayAround(in digitString: String) -> Int {
    if digitString.count < 2 { return 0 }

    var sum = 0

    var firstHalfIndex = digitString.startIndex
    var secondHalfIndex = digitString.index(firstHalfIndex, offsetBy: digitString.count / 2)

    while secondHalfIndex != digitString.endIndex {

        let firstHalfCharacter = digitString[firstHalfIndex]
        let secondHalfCharacter = digitString[secondHalfIndex]
        let firstHalfInt = Int(String(firstHalfCharacter))
        let secondHalfInt = Int(String(secondHalfCharacter))
        if let first = firstHalfInt, let second = secondHalfInt, first == second {
            sum += (first + second)
        }

        firstHalfIndex = digitString.index(after: firstHalfIndex)
        secondHalfIndex = digitString.index(after: secondHalfIndex)
    }
    return sum
}
