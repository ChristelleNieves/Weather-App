//
//  DailyWeatherCell.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/11/21.
//

import UIKit

class DailyWeatherCell: UITableViewCell {
    
    var dailyWeather: [DailyData]?
    var dailyWeatherImages: [UIImage]?
    let tableView = UITableView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        contentView.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DailyDetailsCell.self, forCellReuseIdentifier: "DailyDetailsCell")
        tableView.rowHeight = 50
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = UIColor.white.withAlphaComponent(0.50)
        tableView.allowsSelection = false
        tableView.isScrollEnabled = false
        
        // Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: TableView Delegate

extension DailyWeatherCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyWeather?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DailyDetailsCell", for: indexPath) as! DailyDetailsCell
        
        guard let data = dailyWeather else { return cell }
        
        let date = Date(timeIntervalSince1970: data[indexPath.row].dt)
        let weekDay = Calendar.current.component(.weekday, from: date)
        let dateFormatter = DateFormatter()
        let day = dateFormatter.weekdaySymbols[weekDay - 1]
        let image = dailyWeatherImages?[indexPath.row] ?? UIImage()
        
        cell.setupCellWithData(data: data[indexPath.row], day: day, image: image)
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
}
