import Foundation

let d1p1Input = stringFromResource("Day1Part1")
let d1p1Answer = sumOfAllDigitsMatchingNextDigit(in: d1p1Input)
print("Answer to Day 1, Part 1: \(d1p1Answer)")

let d1p2Answer = sumOfAllDigitsMatchingDigitHalfwayAround(in: d1p1Input)
print("Answer to Day 1, Part 2: \(d1p2Answer)")

let d2p1Input = stringFromResource("Day2Part1")
let d2p1Answer = checkSum(d2p1Input)
print("Answer to Day 2, Part 1: \(d2p1Answer)")

let d2p2Answer = sumOfEvenlyDivisibles(d2p1Input)
print("Answer to Day 2, Part 2: \(d2p2Answer)")
