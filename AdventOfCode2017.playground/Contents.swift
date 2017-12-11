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

let d6p2Input = stringFromResource("Day6Part1")
let (_, d6p2Answer) = countBlockRedistributionsUntilLoopOccursAndReportLoopSize(d6p2Input)
print("Answer to Day 6, Part 2: \(d6p2Answer)")

let d7p1Inputx =
"""
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
"""
let d7p1Input = stringFromResource("Day7Part1")
let d7p1Answer = findBottomNode(d7p1Input)
print("Answer to Day 7, Part 1: \(d7p1Answer)")
