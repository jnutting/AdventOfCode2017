import Foundation

// This is designed to step through the `in` parameter
// using the `enumerated()` method, which in Swift 4
// is the preferred way to traverse a String.
public func sumOfAllDigitsMatchingNextDigit(in digitString: String) -> Int {
    if digitString.count < 2 { return 0 }

    var sum = 0
    var previousInt: Int?

    for (index, character) in digitString.enumerated() {
        let nextInt: Int? = Int(String(character))
        if index == 0 {
            // Special case for matching first character against last
            let finalCharacterIndex = digitString.index(before: digitString.endIndex)
            let finalCharacter = digitString[finalCharacterIndex]
            previousInt = Int(String(finalCharacter))
        }
        if let previous = previousInt, let next = nextInt, previous == next {
            sum += previous
        }
        previousInt = nextInt
    }
    return sum
}
