//
//  Calculation.swift
//  ahamove
//
//  Created by Nghia on 25/09/2024.
//

import Foundation

func roundToK(_ number: Int) -> String {
    if number > 1000 {
        let roundedValue = Double(number) / 1000.0
        if roundedValue.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0fk", roundedValue)
        } else {
            return String(format: "%.1fk", roundedValue)
        }
    } else {
        return String(number)
    }
}

