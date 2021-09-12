//
//  MainViewController.swift
//  weather-app
//
//  Created by Christelle Nieves on 8/25/21.
//

import UIKit

class MainViewController: UIViewController {
    
    let viewModel = WeatherViewModel()
    let tableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.applyGradient()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        getData()
    }
}

// MARK: - UI Setup

extension MainViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CurrentWeatherCell.self, forCellReuseIdentifier: "CurrentWeatherCell")
        tableView.register(HourlyWeatherCell.self, forCellReuseIdentifier: "HourlyWeatherCell")
        tableView.register(DailyWeatherCell.self, forCellReuseIdentifier: "DailyWeatherCell")
        tableView.backgroundColor = UIColor.clear
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        // Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // Get all the data to display
    private func getData() {
        viewModel.getCurrentWeatherData {
            self.viewModel.fetchCityName()
            
            // Cache the images for the hourly weather so we don't have to keep loading them
            self.viewModel.populateHourlyWeatherImages {
                //self.tableView.reloadData()
            }
            
            self.viewModel.populateDailyWeatherImages {
                self.setupTableView()
            }
        }
    }
}

// MARK: - TableView Delegate

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentWeatherCell", for: indexPath) as! CurrentWeatherCell
            
            guard let weatherData = viewModel.currentWeatherData else { return cell }
            cell.setupCellWithWeatherData(data: weatherData, city: viewModel.cityName)
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HourlyWeatherCell", for: indexPath) as! HourlyWeatherCell
            
            cell.setupCellWithWeatherData(data: viewModel.hourlyWeatherData, images: viewModel.hourlyWeatherImages)
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DailyWeatherCell", for: indexPath) as! DailyWeatherCell
            
            cell.dailyWeather = viewModel.dailyWeatherData
            cell.dailyWeatherImages = viewModel.dailyWeatherImages
            cell.tableView.reloadData()
            cell.backgroundColor = UIColor.clear
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return view.frame.height * 0.40
        }
        else if indexPath.row == 1 {
            return view.frame.height * 0.20
        }
        else {
            return view.frame.height * 0.50
        }
    }
}

// MARK: - Weather Reload Manager

extension MainViewController: WeatherReloadManager {
    func reloadTableViewData() {
        tableView.reloadData()
    }
}
