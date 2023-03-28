//
//  BaseMapper.swift
//  CodeTest
//
//  Created by Jose Cruz Perez Pi on 28/03/2023.
//  Copyright © 2023 Jose Cruz Perez Pi. All rights reserved.
//

import Foundation

/**
 Mapper that converts type T(dataModel) into type S(model) and the opposite. It also manages
 lists.
 
 It is used to transform data model to domain model and the oposite, but it can
 be also used to make another mappings.
 */
protocol Mappable {
    
    associatedtype T
    associatedtype S
    
    /// Transform from type T (data model object) to S (domain model object).
    ///
    /// - Parameter dataModel: Type T object.
    /// - Returns: Type S object
    static func transform(_ dataModel:T) -> S
    
    /// Transform from type S (domain model object) to T (data model object).
    ///
    /// - Parameter domainModel: Type S object.
    /// - Returns: Type T object.
    static func reverseTransform(_ model:S) -> T
}

extension Mappable {
    
    static func transform(_ dataModel:T) -> S {
        fatalError("Must override")
    }
    
    static func reverseTransform(_ model:S) -> T {
        fatalError("Must override")
    }
    
    /// Transform from type T (data model object) list to S (domain model
    /// object) list.
    ///
    /// - Parameter dataModelList: Type T object list.
    /// - Returns: Type S object list.
    public static func listTransform(_ dataModelList:[T]) -> [S] {
        return dataModelList.compactMap(transform)
    }
    
    /// Transform from type S (domain model object) list to T (data model
    /// object) list.
    ///
    /// - Parameter domainModelList: Type S object list.
    /// - Returns: Type T object list.
    public static func reverseListTransform(_ modelList:[S]) -> [T] {
        return modelList.compactMap(reverseTransform)
    }
}
