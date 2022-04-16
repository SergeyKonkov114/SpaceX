//
//  TableViewSecondCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation

class TableViewSecondCellViewModel: TableViewCellViewModelType {
    
    let rocketParameters: RocketParameters
    
    init(rocketParameters: RocketParameters) {
        self.rocketParameters = rocketParameters
    }
    
    
    func collectionViewCellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellViewModel? {
        let userDefaults = UserDefaults.standard
        
        switch indexPath.row {
        case 0:
            let height = userDefaults.bool(forKey: "heightMetrics")
            var parameterValue = ""
            var parameterName = "Высота, "
            switch height {
            case true:
                parameterName += "m"
                parameterValue = "\(rocketParameters.rocketHeight.meters)"
            case false:
                parameterName += "ft"
                parameterValue = "\(rocketParameters.rocketHeight.feet)"
            }
            return CollectionViewCellViewModel(rocketParameter: RocketParameter(parameterName: parameterName, parameterValue: parameterValue))
        case 1:
            let diameter = userDefaults.bool(forKey: "diameterMetrics")
            var parameterValue = ""
            var parameterName = "Диаметр, "
            switch diameter {
            case true:
                parameterName += "m"
                parameterValue = "\(rocketParameters.rocketDiameter.meters)"
            case false:
                parameterName += "ft"
                parameterValue = "\(rocketParameters.rocketDiameter.feet)"
            }
            return CollectionViewCellViewModel(rocketParameter: RocketParameter(parameterName: parameterName, parameterValue: parameterValue))
        case 2:
            let mass = userDefaults.bool(forKey: "massMetrics")
            var parameterValue = ""
            var parameterName = "Масса, "
            switch mass {
            case true:
                parameterName += "kg"
                parameterValue = "\(rocketParameters.rocketMass.kg)"
            case false:
                parameterName += "lb"
                parameterValue = "\(rocketParameters.rocketMass.lb)"
            }
            return CollectionViewCellViewModel(rocketParameter: RocketParameter(parameterName: parameterName, parameterValue: parameterValue))
        case 3:
            let payloadWeight = userDefaults.bool(forKey: "payloadWeightMetrics")
            var parameterValue = "-"
            var parameterName = "Нагрузка, "
            switch payloadWeight {
            case true:
                parameterName += "kg"
                if let weight = rocketParameters.payloadWeight?.kg {
                    parameterValue = "\(weight)"
                }
            case false:
                parameterName += "lb"
                if let weight = rocketParameters.payloadWeight?.lb {
                    parameterValue = "\(weight)"
                }
            }
            return CollectionViewCellViewModel(rocketParameter: RocketParameter(parameterName: parameterName, parameterValue: parameterValue))
        default:
            return nil
        }
    }
}
