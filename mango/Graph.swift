//
//  File.swift
//  
//
//  Created by Elliott Harris on 2/12/23.
//

import Foundation

struct Vertex: Hashable, CustomStringConvertible {
    let classLetter: Character
    
    var description: String {
        "\(classLetter)"
    }
}

struct Edge: Hashable {
    var origin: Vertex
    var dest: Vertex
}

struct Graph: Equatable {
    
    var vert: Vertex
    
    init(root: Character) {
        vert = Vertex(classLetter: root)
    }
    
    var adjDict : [Vertex: [Edge]] = [:]
    
    mutating func addVertex(_ letter: Character) {
        let vertex = Vertex(classLetter: letter)
        
        if adjDict[vertex] == nil {
            adjDict[vertex] = []
        }
    }
    
    mutating func addEdge(origin: Vertex, dest: Vertex) {
        let edge = Edge(origin: origin, dest: dest)
        adjDict[origin]?.append(edge)
        for key in adjDict.keys {
            if adjDict[key]!.contains(where: { $0.dest == edge.origin }) {
                adjDict[key]!.append(edge)
            }
        }
    }
    
    mutating func addEdge(_ edge: Edge) {
        adjDict[edge.origin]?.append(edge)
        for key in adjDict.keys {
            if adjDict[key]!.contains(where: { $0.dest == edge.origin }) {
                adjDict[key]!.append(edge)
            }
        }
    }
    
    func printAdjDict() -> String {
        var adjDictString = ""
        
        adjDict.forEach { (v, e) in
            adjDictString.append("\(v)  \(e)\n")
        }
        
        return adjDictString
    }
}
