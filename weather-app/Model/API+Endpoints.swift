//
//  API+Endpoints.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/8/21.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}

struct Endpoint {
    static let apiKey = "f021f5673f9718e5a9a94433ba68ba78"
    static let baseUrl = "https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&units=imperial&appid={API key}"
    static let currentWeather = ""
    static let units = "imperial"
}
