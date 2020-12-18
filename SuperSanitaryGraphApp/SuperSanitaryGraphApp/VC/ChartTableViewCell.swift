//
//  ChartTableViewCell.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 18/12/20.
//

import UIKit
import Charts

class ChartTableViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var pieChartView: PieChartView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureChart(dataSet: PieChartDataSet,title: String){
        print("Done")
        self.title.text = title
        let pieChartData = PieChartData(dataSet: dataSet)
        let format = NumberFormatter()
        format.numberStyle = .none
        let formatter = DefaultValueFormatter(formatter: format)
        pieChartData.setValueFormatter(formatter)
        // 4. Assign it to the chart’s data
        self.pieChartView.data = pieChartData
    }
    
}
