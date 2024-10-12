//
//  HomeViewModel.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @AppStorage("dist") var dist: String = ""
    @AppStorage("time") var time: String = ""
    @AppStorage("avSpeed") var avSpeed: String = ""
    
    @AppStorage("gtime") var gtime: String = ""
    @AppStorage("descents") var descents: String = ""

    @AppStorage("lifts") var lifts: Int = 0
    @AppStorage("goal") var goal: Int = 0
    
    @Published var distAdd: String = ""
    @Published var timeAdd: String = ""
    @Published var avSpeedAdd: String = ""
    
    @Published var gtimeAdd: String = ""
    @Published var descentsAdd: String = ""

    @Published var liftsAdd: String = ""
    @Published var goalAdd: String = ""
    
    @Published var isResult: Bool = false
    @Published var isGoals: Bool = false
    @Published var isLifts: Bool = false

    func calculatePercentage() -> Double {
        
        let value = lifts
        let maxValue = goal
        
        let percentCircle = Double(value) / (Double(maxValue) ?? 1) * 100
        
        return percentCircle
    }
}

