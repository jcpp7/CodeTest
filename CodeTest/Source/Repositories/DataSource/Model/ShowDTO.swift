//
//  ShowDTO.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/3/23.
//

import Foundation

struct ShowDTO: Codable {
    public var id: Int
    public var image: ImageDTO
    public var name: String
    public var rating: AverageDTO?
    public var summary: String

    public init(id: Int, image: ImageDTO, name: String, rating: AverageDTO?, summary: String) {
        self.id = id
        self.image = image
        self.name = name
        self.rating = rating
        self.summary = summary
    }
}

struct AverageDTO: Codable {
    public var average: Float?
    
    public init(average: Float?) {
        self.average = average
    }
}

struct ImageDTO: Codable {
    public var medium: String
    
    public init(medium: String) {
        self.medium = medium
    }
}
