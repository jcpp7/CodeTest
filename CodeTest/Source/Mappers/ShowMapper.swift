//
//  ShowMapper.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/3/23.
//

import Foundation

class ShowMapper:Mappable {
    
    static func transform(_ dataModel: String) -> Show {
        Show(title: "", date: "", image: "")
    }
}
