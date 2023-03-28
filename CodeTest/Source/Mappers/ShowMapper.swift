//
//  ShowMapper.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/3/23.
//

import Foundation

class ShowMapper: Mappable {
    
    static func transform(_ dataModel: ShowDTO) -> Show {
        Show(image: ShowImage(medium: dataModel.image.medium),
             name: dataModel.name,
             rating: Average(average: dataModel.rating?.average),
             summary: dataModel.summary)
    }
}
