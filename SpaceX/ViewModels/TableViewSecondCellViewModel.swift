//
//  TableViewSecondCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation

class TableViewSecondCellViewModel: TableViewCellViewModelType {
    
    let rocketParameters: RocketParameters
    
//    var rocketHeight: String {
//        return "\(rocketParameters.rocketHeight), m"
//    }
//
//    var rocketDiameter: String {
//        return "\(rocketParameters.rocketDiameter), m"
//    }
//
//    var rocketMass: String {
//        return "\(rocketParameters.rocketMass), kg"
//    }
//
//    var payloadWeight: String {
//        let payloadWeight = rocket.payloadWeights.filter { $0.id == "leo"}.first
//        guard let payloadWeight = payloadWeight else { return "-, kg" }
//        return "\(payloadWeight.kg), kg"
//    }
    
    init(rocketParameters: RocketParameters) {
        self.rocketParameters = rocketParameters
    }
    
    
    func collectionViewCellViewModel(forIndexPath indexPath: IndexPath) -> CollectionViewCellViewModel? {
        
        switch indexPath.row {
        case 0:
            let rocketParameter = RocketParameter(
                parameterName: "Высота, m",
                parameterValue: "\(rocketParameters.rocketHeight.meters)"
            )
            return CollectionViewCellViewModel(rocketParameter: rocketParameter)
        case 1:
            let rocketParameter = RocketParameter(
                parameterName: "Диаметр, m",
                parameterValue: "\(rocketParameters.rocketDiameter.meters)"
            )
            return CollectionViewCellViewModel(rocketParameter: rocketParameter)
        case 2:
            let rocketParameter = RocketParameter(
                parameterName: "Масса, kg",
                parameterValue: "\(rocketParameters.rocketMass.kg)"
            )
            return CollectionViewCellViewModel(rocketParameter: rocketParameter)
        case 3:
            var payloadWeight: String = "-"
            if let weight = rocketParameters.payloadWeight?.kg {
                payloadWeight = "\(weight)"
            }
            let rocketParameter = RocketParameter(
                parameterName: "Нагрузка, kg",
                parameterValue: payloadWeight
            )
            return CollectionViewCellViewModel(rocketParameter: rocketParameter)
        default:
            return nil
        }
    }
    
//    func prepareRocketParameter(parameters: RocketParameters) -> RocketParameter {
//        parameters.
//    }
            
}
