import Foundation

class Node: CustomStringConvertible {
    weak var parent: Node?
    let name: String
    let weight: Int
    let childNames: [String]

    init(name: String, weight: Int, childNames: [String]? = nil) {
        self.name = name
        self.weight = weight
        self.childNames = childNames ?? []
    }

    var description: String {
        return "\(name) (\(weight)) -> \(childNames)"
    }

    // Input lines look like these:
    //dxffsoq (58)
    //sxcxmg (98) -> tcrpymd, endpyd

    // This parsing code is one of the worst things I've ever written,
    // and honestly makes me question everything.
    static func decode(from line: String) -> Node? {
        let parts = line.components(separatedBy: " (")
        let name = parts[0]
        let rest = String(parts[1])

        let parts2 = rest.split(separator:")")
        let weight = Int(parts2[0]) ?? 0
        if parts2.count == 1 {
            return Node(name: name, weight: weight)
        }
        let childSpec = parts2[1]

        let parts3 = childSpec.components(separatedBy: " -> ")
        let childSpec2 = parts3[1]

        let childNames = childSpec2.components(separatedBy: ", ")

        return Node(name: name, weight: weight, childNames: childNames)
    }
}

class NodeCache {
    private var nodes = [String: Node]()

    func add(node: Node) {
        nodes[node.name] = node
    }

    func updateParents() {
        for (name, node) in nodes {
            let children = node.childNames.map { nodes[$0] }.flatMap { $0 }
            for child in children {
                child.parent = node
            }
        }
    }

    func rootNodes() -> [Node] {
        return nodes.values.filter { $0.parent == nil}
    }
}

public func findBottomNode(_ input: String) -> String {
    let nodeCache = NodeCache()
    let lines = input.split(separator: "\n")
    for line in lines {
        if let node = Node.decode(from: String(line)) {
            nodeCache.add(node: node)
        } else {
            print("Failed to decode node from line: \(line)")
        }
    }
    nodeCache.updateParents()
    let roots = nodeCache.rootNodes()
    if roots.count != 1 {
        print("Bad roots! \(roots)")
    }
    return roots[0].name
}
