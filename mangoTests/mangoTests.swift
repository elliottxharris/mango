//
//  mangoTests.swift
//  mangoTests
//
//  Created by Elliott Harris on 3/5/23.
//

import XCTest
@testable import mango

final class MangoTests: XCTestCase {
    func testBasic() throws {
        let deps = [
            "A B",
            "B C",
            "C A"
        ]
        
        let edgeAB = Edge(origin: Vertex(classLetter: "A"), dest: Vertex(classLetter: "B"))
        let edgeBC = Edge(origin: Vertex(classLetter: "B"), dest: Vertex(classLetter: "C"))
        let edgeCA = Edge(origin: Vertex(classLetter: "C"), dest: Vertex(classLetter: "A"))
        
        var graph = Graph(root: "A")
        graph.addVertex("A")
        graph.addVertex("B")
        graph.addVertex("C")
        graph.addEdge(edgeAB)
        graph.addEdge(edgeBC)
        graph.addEdge(edgeCA)
        
        
        XCTAssertEqual(mangoTest(deps: deps)!.printAdjDict(), graph.printAdjDict())
    }
}
