//
//  Show.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/3/23.
//

import Foundation

struct Show: Hashable {
    static func == (lhs: Show, rhs: Show) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public var id: Int
    public var image: ShowImage
    public var name: String
    public var rating: Average?
    public var summary: String
}
