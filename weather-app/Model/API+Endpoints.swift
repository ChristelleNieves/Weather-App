//
//  API+Endpoints.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/11/21.
//

import Foundation

struct Endpoint {
    static var baseUrl = "https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&units=imperial&appid={API key}"
    static var apiKey = "f021f5673f9718e5a9a94433ba68ba78"
}
