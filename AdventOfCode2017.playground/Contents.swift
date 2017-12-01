import Foundation

let d1p1InputURL = Bundle.main.url(forResource:"Day1Part1", withExtension: "txt")!
let d1p1Input = try! String(contentsOf: d1p1InputURL, encoding: String.Encoding.utf8)
let d1p1Answer = sumOfAllDigitsMatchingNextDigit(in: d1p1Input)
print("Answer to Day 1, Part 1: \(d1p1Answer)")

let d1p2Answer = sumOfAllDigitsMatchingDigitHalfwayAround(in: d1p1Input)
print("Answer to Day 1, Part 2: \(d1p2Answer)")
