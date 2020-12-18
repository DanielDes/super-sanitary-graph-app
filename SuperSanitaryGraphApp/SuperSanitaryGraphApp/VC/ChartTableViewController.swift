//
//  ChartTableViewController.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import UIKit
import Charts
class ChartTableViewController: UITableViewController {
    var dataSets : [PieChartDataSet]?
    var questions : [Questions]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.register(ChartCellTableViewCell.self, forCellReuseIdentifier: "ChartCell")
        self.tableView.register(UINib.init(nibName: "ChartTableViewCell", bundle: nil), forCellReuseIdentifier: "ChartCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Networking.fetchData(fromURL: Networking.apiURL!) { (response: APIResponse) in
            self.questions = response.questions
            self.dataSets = response.createDataSets()
            print("Done")
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let response = dataSets else {return 0}
        return response.count
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChartCell", for: indexPath) as? ChartTableViewCell,
              let dataSets = self.dataSets,
              let question = self.questions else {return UITableViewCell()}
        let dataSet = dataSets[indexPath.row]
        let title = question[indexPath.row].text
        cell.configureChart(dataSet: dataSet,title: title)
        

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }

    

}
