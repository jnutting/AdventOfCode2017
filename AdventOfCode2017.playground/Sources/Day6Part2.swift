import Foundation

private func redistribute(_ blockSizes: [Int]) -> [Int] {
    var indexOfHighest: Int = 0
    var highest: Int = -1

    for (index, blockSize) in blockSizes.enumerated() {
        if blockSize > highest {
            highest = blockSize
            indexOfHighest = index
        }
    }

    var newBlockSizes = blockSizes
    var blocksToRedistribute = highest
    var redistributionIndex = indexOfHighest

    newBlockSizes[redistributionIndex] = 0
    while blocksToRedistribute > 0 {
        redistributionIndex += 1
        blocksToRedistribute -= 1
        if redistributionIndex >= newBlockSizes.count {
            redistributionIndex = 0
        }
        newBlockSizes[redistributionIndex] += 1
    }

    return newBlockSizes
}

public func countBlockRedistributionsUntilLoopOccursAndReportLoopSize(_ allBlocks: String) -> (Int, Int) {
    var blockSizes = (allBlocks as NSString).components(separatedBy: .whitespaces).map { Int($0) ?? 0 }

    var redistributionCount = 0
    var blockSizeHistory = [[Int]]()
    blockSizeHistory.append(blockSizes)
    var historyIndex: Int!

    while true {
        blockSizes = redistribute(blockSizes)
        redistributionCount += 1

        historyIndex = blockSizeHistory.index(where: { $0 == blockSizes})
        if historyIndex != nil {
            break
        }
//        if blockSizeHistory.contains(where: { $0 == blockSizes}) {
//            break
//        }
        blockSizeHistory.append(blockSizes)
    }
    let loopSize = blockSizeHistory.count - historyIndex
    return (redistributionCount, loopSize)
}
