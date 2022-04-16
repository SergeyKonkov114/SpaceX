//
//  ParameterType.swift
//  SpaceX
//
//  Created by Сергей Коньков on 11.04.2022.
//

import Foundation

enum ParameterType: String {
    case height = "Высота"
    case diameter = "Диаметр"
    case mass = "Масса"
    case payloadWeight = "Полезная нагрузка"
    
    var parameterMetric: [String] {
        switch self {
        case .height, .diameter:
            return ["m", "ft"]
        case .mass, .payloadWeight:
            return ["kg", "lb"]
        }
    }
}

