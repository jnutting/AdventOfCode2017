import Foundation

/*
 Some notes about this "spiral memory" puzzle:

 17  16  15  14  13
 18   5   4   3  12
 19   6   1   2  11
 20   7   8   9  10
 21  22  23---> ...

 We can think of this as concentric rings with a particular width and height,
 and with particular number of items in each ring, and with a maximum integer
 contained in that ring.

 Ring 1: 1x1, 1 item, max 1
 Ring 2: 3x3, 8 items, max 9
 Ring 3: 5x5, 16 items, max 25

 We'll call any ring number "n"

 The value of the n.width is equal to (n-1).width + 2.

 The max number contained in a ring is n.width * n.height.
 The number of items in ring number n is equal to
   (n.width * n.height) - ((n-1).width * (n-1).height)


 Within each ring, we have to figure out how many steps
 any given location is away from the nearest midpoint of an
 edge, since those midpoints are a known number of steps
 from the starting point (n - 1)
 */

func ringSize(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    } else if n == 1 {
        return 1
    } else {
        return ringSize(n - 1) + 2
    }
}

func numberOfItemsInRing(_ n: Int) -> Int {
    if n <= 0 {
        return 0
    }
    let nRingSize = ringSize(n)
    let nMinusOneRingSize = ringSize(n - 1)
    let totalIncludingThisRing = nRingSize * nRingSize
    let totalExcludingThisRing = nMinusOneRingSize * nMinusOneRingSize
    let thisRing = totalIncludingThisRing - totalExcludingThisRing
    return thisRing
}

func maxForRing(_ n: Int) -> Int {
    let size = ringSize(n)
    return size * size
}

func minForRing(_ n: Int) -> Int {
    let size = ringSize(n - 1)
    return size * size + 1
}

func ring(_ n: Int, contains position: Int) -> Bool {
    if n <= 0 {
        return false
    }

    return minForRing(n) <= position &&
    position <= maxForRing(n)
}

func distanceToMidpointInRing(_ n: Int, from i: Int) -> Int {
    if i <= 1 { return 0 }
    let itemCountInRing = numberOfItemsInRing(n)
    let corner4 = maxForRing(n)
    let corner3 = corner4 - itemCountInRing / 4
    let corner2 = corner4 - itemCountInRing / 2
    let corner1 = corner4 - itemCountInRing * 3 / 4
    let corner0 = corner4 - itemCountInRing

    if i < corner1 {
        let midPoint = (corner1 + corner0) / 2
        return abs(midPoint - i)
    } else if i < corner2 {
        let midPoint = (corner2 + corner1) / 2
        return abs(midPoint - i)
    } else if i < corner3 {
        let midPoint = (corner3 + corner2) / 2
        return abs(midPoint - i)
    } else {
        let midPoint = (corner4 + corner3) / 2
        return abs(midPoint - i)
    }
}

public func distanceToMidpointFrom(_ i: Int) -> Int {
    let n = ringContaining(i)
    let ringDistanceFromEdgeCenter = n - 1
    let distanceToMidpoint = distanceToMidpointInRing(n, from: i)
    return distanceToMidpoint + ringDistanceFromEdgeCenter
}

public func ringContaining(_ i: Int) -> Int {
    guard i > 0 else { return 0 }

    var ringNumber: Int = 1

    while !ring(ringNumber, contains: i) {
        ringNumber += 1
    }
    return ringNumber
}
