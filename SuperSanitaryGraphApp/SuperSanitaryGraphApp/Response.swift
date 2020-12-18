//
//  Response.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import Foundation


struct APIResponse : Codable {
    var stats : StatisticResponse
    var colors : [String]
}


struct StatisticResponse : Codable {
    let title : String
    let percentage : Int
}
