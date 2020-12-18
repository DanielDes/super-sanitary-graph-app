//
//  Response.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import Foundation
import Charts


struct APIResponse : Codable {
    var questions : [Questions]
    var colors : [String]
}

struct Questions : Codable {
    let total : Int
    let text : String
    var chartData : [ChartData]
    
    
    func giveEntries() -> [PieChartDataEntry]{
        let entries = self.chartData.map { (chardata) -> PieChartDataEntry in
            let value = chardata.percetnage
            let label = chardata.text
            return PieChartDataEntry(value: Double(value), label: label)
        }
        return entries
    }
}

struct ChartData : Codable {
    let text : String
    let percetnage : Int
}



