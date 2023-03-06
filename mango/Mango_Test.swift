func mangoTest(deps: [String]) -> Graph? {
    guard let rootString = deps.first, let root = rootString.first else { return nil }
    var graph = Graph(root: root)
    for depList in deps {
        guard depList.count >= 3 else { return nil }
        let classLetter = depList.first!
        graph.addVertex(classLetter)
        
        let directDeps = depList.split(separator: " ")[1...]
        
        directDeps.forEach { graph.addVertex($0.first!) }
        
        directDeps.forEach {
            graph.addEdge(
                origin: Vertex(classLetter: classLetter),
                dest: Vertex(classLetter: $0.first!)
            )
        }
    }
    
    return graph
}

