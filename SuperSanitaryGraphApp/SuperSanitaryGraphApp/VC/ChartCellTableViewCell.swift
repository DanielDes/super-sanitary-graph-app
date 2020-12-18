//
//  ChartCellTableViewCell.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import UIKit
import Charts

class ChartCellTableViewCell: UITableViewCell {
    private var question : Questions!
    
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        self.contentView.addSubview(label)
        label.setConstraintsToBordersAndSizes(topAnchor: self.contentView.topAnchor, bottomAnchor: nil, leadingAnchor: self.contentView.leadingAnchor, trailingAnchor: self.contentView.trailingAnchor, width: nil, height: 50, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        label.numberOfLines = 4
        return label
    }()
    
    private lazy var chart : PieChartView = {
        let chart = PieChartView()
        
        
        self.contentView.addSubview(chart)
        chart.setConstraintsToBordersAndSizes(topAnchor: self.contentView.bottomAnchor, bottomAnchor: self.contentView.bottomAnchor, leadingAnchor: self.contentView.leadingAnchor, trailingAnchor: self.contentView.trailingAnchor, width: nil, height: nil)
        return chart
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configureCell(question: Questions){
        self.question = question
        self.titleLabel.text = question.text
        let entries = question.giveEntries()
        print(entries)
        let set = PieChartDataSet(entries: entries, label: "")
        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]
        
        let data = PieChartData(dataSet: set)
        
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(.systemFont(ofSize: 11, weight: .light))
        data.setValueTextColor(.black)
        
        self.chart.data = data
        print(question.text)
    }

}
