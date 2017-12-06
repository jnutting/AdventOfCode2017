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

let d3p1Answer = distanceToMidpointFrom(265149)
print("Answer to Day 3, Part 1: \(d3p1Answer)")

let d3p2Answer = findFirstNumberInSpiralLargerThan(265149)
print("Answer to Day 3, Part 2: \(d3p2Answer)")

let d4p1Input = stringFromResource("Day4Part1")
let d4p1Answer = validPassPhraseCount(for: d4p1Input)
print("Answer to Day 4, Part 1: \(d4p1Answer)")

let d4p2Answer = validPassPhraseCountWithoutAnagrams(for: d4p1Input)
print("Answer to Day 4, Part 2: \(d4p2Answer)")

let d5p1Input = stringFromResource("Day5Part1")
let d5p1Answer = numberOfJumpsToExit(d5p1Input)
print("Answer to Day 5, Part 1: \(d5p1Answer)")

let d5p2Answer = numberOfJumpsToExitStrange(d5p1Input)
print("Answer to Day 5, Part 2: \(d5p2Answer)")

let d6p1Input = stringFromResource("Day6Part1")
let d6p1Answer = countBlockRedistributionsUntilLoopOccurs(d6p1Input)
print("Answer to Day 6, Part 1: \(d6p1Answer)")
