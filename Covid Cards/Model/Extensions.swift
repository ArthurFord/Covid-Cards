//
//  Extensions.swift
//  Covid Cards
//
//  Created by Arthur Ford on 10/3/21.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkGray = Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255)
    static let darkerGray = Color(red: 20 / 255, green: 20 / 255, blue: 20 / 255)
    static let darkestGray = Color(red: 10 / 255, green: 10 / 255, blue: 10 / 255)
    
}

var rowGradient = LinearGradient(colors: [Color.darkGray, Color.darkerGray], startPoint: .topLeading, endPoint: .bottomTrailing)
var listGradient = LinearGradient(colors: [Color.darkerGray, Color.darkestGray], startPoint: .bottomTrailing, endPoint: .topLeading)
