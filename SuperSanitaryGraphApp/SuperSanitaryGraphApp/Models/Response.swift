//
//  Response.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import Foundation


struct APIResponse : Codable {
    var questions : [Questions]
    var colors : [String]
}

struct Questions : Codable {
    let total : Int
    let text : String
    var chartData : [ChartData]
}

struct ChartData : Codable {
    let text : String
    let percetnage : Int
}



