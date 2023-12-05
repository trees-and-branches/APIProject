//
//  StateRepModel.swift
//  APIProject
//
//  Created by shark boy on 12/4/23.
//

import Foundation

struct StateRep: Decodable {
    var name: String
    var party: String
    var phone: String
}
struct StateRepResponse: Decodable {
    var results: [StateRep]
}














//    enum CodingKeys: String, CodingKey {
//            case results
//    }
//    enum resultsCodingKeys: String, CodingKey {
//        case name
//        case party
//        case phone
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        var resultsContainer = try container.nestedUnkeyedContainer(forKey: .results)
//        
//        let resultContainer = try resultsContainer.nestedContainer(keyedBy: resultsCodingKeys.self)
//        self.name = try resultContainer.decode(String.self, forKey: .name)
//        self.party = try resultContainer.decode(String.self, forKey: .party)
//        self.phone = try resultContainer.decode(String.self, forKey: .phone)
//    }

