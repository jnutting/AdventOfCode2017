import Foundation

func redistribute(_ blockSizes: [Int]) -> [Int] {
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

public func countBlockRedistributionsUntilLoopOccurs(_ allBlocks: String) -> Int {
    var blockSizes = (allBlocks as NSString).components(separatedBy: .whitespaces).map { Int($0) ?? 0 }

    var redistributionCount = 0
    var blockSizeHistory = [[Int]]()
    blockSizeHistory.append(blockSizes)

    while true {
        blockSizes = redistribute(blockSizes)
        redistributionCount += 1
        if blockSizeHistory.contains(where: { $0 == blockSizes}) {
            break
        }
        blockSizeHistory.append(blockSizes)
    }
    return redistributionCount
}
