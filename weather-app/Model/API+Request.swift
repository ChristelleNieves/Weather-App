//
//  API+Request.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/8/21.
//

import Foundation
import UIKit

public class API {
    
    func fetchData(completionHandler: @escaping (apiResponse) -> Void) {
        guard let url = URL(string: getUrlString()) else { return }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            // Handle error
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            // Handle response
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Unexpected error code: \(response.debugDescription)")
                return
            }
            
            // Handle data
            if let data = data,
               let weatherData = try? JSONDecoder().decode(apiResponse.self, from: data) {
                completionHandler(weatherData)
            }
        })
        
        task.resume()
    }
    
    // Return a UIImage from a URL endpoint
    func getImage(imageCode: String) -> UIImage {
            var image = UIImage()
            guard let url = URL(string: "https://openweathermap.org/img/wn/\(imageCode).png") else { return image }
            let data = try? Data(contentsOf: url)
            
            if let imageData = data {
                image = UIImage(data: imageData) ?? UIImage()
            }
            
            return image
        }
    
    func getUrlString() -> String {
        let location = LocationManager().fetchLocation()
        var urlString = Endpoint.baseUrl.replacingOccurrences(of: "{lat}", with: String(location.0))
        urlString = urlString.replacingOccurrences(of: "{lon}", with: String(location.1))
        urlString = urlString.replacingOccurrences(of: "{API key}", with: Endpoint.apiKey)
        
        print(urlString)
        return urlString
    }
}
