import Foundation

public func numberOfJumpsToExit(_ allInstructions: String) -> Int {
    var instructions = allInstructions.split(separator: "\n").map { Int($0) ?? 0 }
    var jumpCount = 0
    var currentInstructionIndex = 0

    while 0 <= currentInstructionIndex && currentInstructionIndex < instructions.count {
        let instruction = instructions[currentInstructionIndex]
        instructions[currentInstructionIndex] = instruction + 1
        currentInstructionIndex += instruction
        jumpCount += 1
    }
    return jumpCount
}
