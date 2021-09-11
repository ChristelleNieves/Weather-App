//
//  Date+Ext.swift
//  weather-app
//
//  Created by Christelle Nieves on 9/11/21.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

//    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
//        return calendar.component(component, from: self)
//    }
}
