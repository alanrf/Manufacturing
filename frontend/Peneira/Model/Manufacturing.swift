//
//  Manufacturing.swift
//  Peneira
//
//  Created by Alan Fritsch on 24/05/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation

struct Sensor: Codable {
    var id: Int
    var description: String
    var vibration: Double
    var insideLimitOscillation: Bool {
        return self.vibration >= 0.15 && self.vibration <= 0.45
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case vibration
    }
}

struct Sensors: Codable {
    let sensors: [Sensor]
}
