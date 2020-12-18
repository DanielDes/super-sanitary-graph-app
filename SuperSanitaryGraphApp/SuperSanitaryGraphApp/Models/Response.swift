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
    
    func createDataSets() -> [PieChartDataSet]{
        let datasets = questions.map { (question) -> PieChartDataSet in
            return question.createDataSet()
        }
        return datasets
    }
}

struct Questions : Codable {
    let total : Int
    let text : String
    var chartData : [ChartData]
    
    
    func createDataSet() -> PieChartDataSet{
        var dataPoint: [String] = []
        var values: [Double] = []
        chartData.forEach({ (chardata) in
            dataPoint.append(chardata.text)
            values.append(Double(chardata.percetnage))
        })
        var dataEntries: [ChartDataEntry] = []
        
        for (value,point) in zip(values,dataPoint){
            let dataEntry = PieChartDataEntry(value: value, label: point, data: point)
            dataEntries.append(dataEntry)
        }
        let dataSet = PieChartDataSet(entries: dataEntries, label: nil)
        dataSet.colors = colorsOfCharts(numbersOfColor: dataPoint.count)
        return dataSet
    }
    private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
      var colors: [UIColor] = []
      for _ in 0..<numbersOfColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        colors.append(color)
      }
      return colors
    }

}

struct ChartData : Codable {
    let text : String
    let percetnage : Int
}



