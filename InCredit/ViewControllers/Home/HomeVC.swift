//
//  HomeVC.swift
//  InCredit
//
//  Created by Nguyen Tan Dung on 9/11/20.
//  Copyright © 2020 Nguyen Tan Dung. All rights reserved.
//

import UIKit
import Charts


class HomeVC: BaseVC {

    @IBOutlet weak var btnLogOut: UIButton!
    @IBOutlet weak var viewLineChart: LineChartView!
    @IBOutlet weak var viewPieChart: PieChartView!
    @IBOutlet weak var viewLineChart2: LineChartView!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    var creaditValues: [ChartDataEntry] = []
    var moneyValues: [ChartDataEntry] = []
    
    let time = ["Day", "Evening", "Night"]
    var timeData: [Double] = []
    var dataEntries: [ChartDataEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.navigationController as! MainNC).hiddenBtn()
        getAPI()
    }

    @IBAction func btnLogOutClicked(_ sender: Any) {
        (self.navigationController as! MainNC).logOut()
    }
    
    func setData() {
        let set1 = LineChartDataSet(entries: creaditValues, label: "Credit score")
        set1.mode = .cubicBezier
//        set1.drawCirclesEnabled = false
//        set1.setColor(.white)
//        set1.fill = Fill(color: .white)
        let data = LineChartData(dataSet: set1)
//        data.setDrawValues(false)
        viewLineChart.data = data
        
        let set2 = LineChartDataSet(entries: moneyValues, label: "Sum of change values")
        set1.mode = .cubicBezier
        let data2 = LineChartData(dataSet: set2)
        viewLineChart2.data = data2
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        for i in 0..<dataPoints.count {
            let dataEntry1 = PieChartDataEntry(value: values[i], label: dataPoints[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry1)
        }
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Time of the day")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        var colors: [UIColor] = []

        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
          
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        pieChartDataSet.colors = colors
        viewPieChart.legend.textColor = .black
        viewPieChart.data = pieChartData
    }
    
    func getAPI() {
        HttpRequests.request(request: ChartAPI(phone: "364139627")) { [weak self] (result, response) in
            guard let weakSelf = self else { return }
            if result {
                for creditScore in response.creditScore {
                    weakSelf.creaditValues.append(ChartDataEntry(x: Double(creditScore.month) , y: Double(creditScore.score)))
                }
                weakSelf.timeData = [Double(response.numberPerMonth.day), Double(response.numberPerMonth.evening), Double(response.numberPerMonth.night)]
                for sumData in response.sum {
                    weakSelf.moneyValues.append(ChartDataEntry(x: Double(sumData.month) , y: Double(sumData.score)))
                }
                weakSelf.setData()
                weakSelf.setChart(dataPoints: weakSelf.time, values: weakSelf.timeData)
                weakSelf.lblAge.text = "Age: \(response.age)"
                weakSelf.lblCity.text = "City: \(response.city)"
                weakSelf.lblPhone.text = "Phone: \(response.phone)"
            }
        }
    }
}

extension HomeVC: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
}
