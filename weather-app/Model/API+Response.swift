//
//  API+Response.swift
//  weather-app
//
//  Created by Christelle Nieves on 8/25/21.
//

import Foundation

struct apiResponse: Codable {
    var lat: Double
    var lon: Double
    var timezone: String
    var current: CurrentData
    var hourly: [CurrentData]
    var daily: [DailyData]
}

struct CurrentData: Codable {
    var dt: Double
    var temp: Double
    var feels_like: Double
    var humidity: Double
    var dew_point: Double
    var clouds: Double
    var uvi: Double
    var visibility: Double
    var wind_speed: Double
    var wind_deg: Double
    var weather: [WeatherDetails]
}

struct DailyData: Codable {
    var dt: Double
    var temp: DailyTemp
    var weather: [WeatherDetails]
}

struct DailyTemp: Codable {
    var min: Double
    var max: Double
}

struct WeatherDetails: Codable {
    var id: Double
    var main: String
    var description: String
    var icon: String
}
