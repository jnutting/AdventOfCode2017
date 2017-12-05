import Foundation

// This feels like an ugly brute-force approach, but maybe that's
// the only way to solve this.

// GridPoint is lifted straight from Apple's documentation for Hashable, because why not?
struct GridPoint: Hashable {
    let x: Int
    let y: Int

    var hashValue: Int {
        return x.hashValue ^ y.hashValue &* 16777619
    }

    static func == (lhs: GridPoint, rhs: GridPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

class Spiral {
    private var spiralStore = Dictionary<GridPoint, Int>()

    init(valueAtOrigin: Int) {
        self.store(valueAtOrigin, at: GridPoint(x: 0,  y: 0))
    }

    func store(_ value: Int, at: GridPoint) {
        spiralStore[at] = value
    }

    func valueAt(_ gridPoint: GridPoint) -> Int {
        return spiralStore[gridPoint] ?? 0
    }

    func getSumOfValuesSurrounding(_ gridPoint: GridPoint) -> Int {
        let x = gridPoint.x
        let y = gridPoint.y
        let sum = self.valueAt(GridPoint(x: x + 1, y: y + 1))
            + self.valueAt(GridPoint(x: x + 1, y: y + 0))
            + self.valueAt(GridPoint(x: x + 1, y: y - 1))
            + self.valueAt(GridPoint(x: x + 0, y: y + 1))
            + self.valueAt(GridPoint(x: x + 0, y: y - 1))
            + self.valueAt(GridPoint(x: x - 1, y: y + 1))
            + self.valueAt(GridPoint(x: x - 1, y: y + 0))
            + self.valueAt(GridPoint(x: x - 1, y: y - 1))

        return sum
    }

    func nextGridPoint(after gridPoint: GridPoint, previousDirection: MovementDirection) -> (GridPoint, MovementDirection) {
        if gridPoint == GridPoint(x: 0, y: 0) {
            return (GridPoint(x: 1, y: 0), movementDirection: .right)
        }

        let x = gridPoint.x
        let y = gridPoint.y
        switch previousDirection {
        case .right:
            if valueAt(GridPoint(x: x, y: y + 1)) == 0 {
                return (GridPoint(x: x, y: y + 1), .up)
            } else {
                return (GridPoint(x: x + 1, y: y), .right)
            }
        case .up:
            if valueAt(GridPoint(x: x - 1, y: y)) == 0 {
                return (GridPoint(x: x - 1, y: y), .left)
            } else {
                return (GridPoint(x: x, y: y + 1), .up)
            }
        case .left:
            if valueAt(GridPoint(x: x, y: y - 1)) == 0 {
                return (GridPoint(x: x, y: y - 1), .down)
            } else {
                return (GridPoint(x: x - 1, y: y), .left)
            }
        case .down:
            if valueAt(GridPoint(x: x + 1, y: y)) == 0 {
                return (GridPoint(x: x + 1, y: y), .right)
            } else {
                return (GridPoint(x: x, y: y - 1), .down)
            }
        }
    }

}

enum MovementDirection {
    case up, down, left, right
}

public func findFirstNumberInSpiralLargerThan(_ target: Int) -> Int {
    let spiral = Spiral(valueAtOrigin: 1)
    var currentPoint = GridPoint(x: 0, y: 0)
    var currentPointValue = 0
    var previousDirection = MovementDirection.right

    while currentPointValue < target {
        let (nextPoint, direction) = spiral.nextGridPoint(after: currentPoint, previousDirection: previousDirection)
        let sum = spiral.getSumOfValuesSurrounding(nextPoint)
        spiral.store(sum, at: nextPoint)

        currentPoint = nextPoint
        currentPointValue = sum
        previousDirection = direction
    }
    return currentPointValue
}


