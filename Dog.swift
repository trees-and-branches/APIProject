//
//  DogModel.swift
//  APIProject
//
//  Created by shark boy on 12/4/23.
//

import Foundation



struct Dog: Decodable {
    var dogImage: String
    
    enum CodingKeys: String, CodingKey {
        case dogImage = "message"
    }
    
}
