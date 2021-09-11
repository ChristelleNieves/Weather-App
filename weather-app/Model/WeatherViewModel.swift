//
//  WeatherViewModel.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/9/21.
//

import Foundation
import CoreLocation
import UIKit

public class WeatherViewModel {
    
    weak var delegate: WeatherReloadManager?
    var cityName = ""
    var currentWeatherData: CurrentData?
    var hourlyWeatherData = [CurrentData]()
    var dailyWeatherData = [DailyData]()
    var weatherImages = [UIImage]()
    
    func getCurrentWeatherData(completionHandler: @escaping () -> Void) {
        API().fetchData(completionHandler: { data in
            self.currentWeatherData = data.current
            self.hourlyWeatherData = data.hourly
            self.dailyWeatherData = data.daily
            
            if self.hourlyWeatherData.count > 12 {
                self.hourlyWeatherData.removeSubrange(12...self.hourlyWeatherData.count - 1)
            }
            
            if self.dailyWeatherData.count > 9 {
                self.dailyWeatherData.removeSubrange(9...self.dailyWeatherData.count - 1)
            }
            
            DispatchQueue.main.async {
                completionHandler()
            }
        })
    }
    
    func fetchCityName() {
        let geoCoder = CLGeocoder()
        let locationManager = LocationManager()
        let _ = locationManager.fetchLocation()
        let currentLocation = locationManager.currentLocation
        
        geoCoder.reverseGeocodeLocation(currentLocation!, completionHandler: { (placemarks, _) -> Void in
            placemarks?.forEach { (placemark) in
                
                if let city = placemark.locality {
                    self.cityName = city
                    self.delegate?.reloadTableViewData()
                }
            }
        })
    }
    
    func populateWeatherImages(completionHandler: @escaping () -> Void) {
        for data in hourlyWeatherData {
            let image = API().getImage(imageCode: data.weather[0].icon)
            weatherImages.append(image)
            
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
}
