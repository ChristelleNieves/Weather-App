//
//  CurrentWeatherCell.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/10/21.
//

import UIKit

class CurrentWeatherCell: UITableViewCell {
    
    var weatherData: CurrentData?
    let cityLabel = UILabel()
    let weatherDescriptionLabel = UILabel()
    let tempLabel = UILabel()
    let highLabel = UILabel()
    let feelsLikeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        setupTempLabel()
        setupWeatherDescriptionLabel()
        setupCityLabel()
        setupFeelsLikeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup

extension CurrentWeatherCell {
    private func setupTempLabel() {
        contentView.addSubview(tempLabel)
        
        // Appearance
        tempLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 100, weight: .ultraLight)
        tempLabel.textColor = UIColor.white
        
        // Constraints
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tempLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10),
            tempLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 5)
        ])
    }
    
    private func setupWeatherDescriptionLabel() {
        contentView.addSubview(weatherDescriptionLabel)
        
        // Appearance
        weatherDescriptionLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
        weatherDescriptionLabel.textColor = UIColor.white
        
        // Constraints
        weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            weatherDescriptionLabel.bottomAnchor.constraint(equalTo: tempLabel.topAnchor),
            weatherDescriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupCityLabel() {
        contentView.addSubview(cityLabel)
        
        // Appearance
        cityLabel.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        cityLabel.textColor = UIColor.white
        
        // Constraints
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityLabel.bottomAnchor.constraint(equalTo: weatherDescriptionLabel.topAnchor, constant: -5),
            cityLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupFeelsLikeLabel() {
        contentView.addSubview(feelsLikeLabel)
        
        // Appearance
        feelsLikeLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        feelsLikeLabel.textColor = UIColor.white
        
        // Constraints
        feelsLikeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            feelsLikeLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            feelsLikeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}

// MARK: Auxiliary Functions

extension CurrentWeatherCell {
    func setupCellWithWeatherData(data: CurrentData, city: String) {
        tempLabel.text = "\(Int(data.temp))°"
        weatherDescriptionLabel.text = "\(data.weather[0].description)"
        cityLabel.text = city
        feelsLikeLabel.text = "Feels like: \(Int(data.feels_like))°"
    }
}
