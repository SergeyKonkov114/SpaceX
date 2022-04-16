//
//  SettingsControllerViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 11.04.2022.
//

import Foundation

class SettingsControllerViewModel {
    
    
    func settingsCollectionViewCellViewModel(forIndexPath indexPath: IndexPath) -> SettingsCollectionViewCellViewModel? {
        let userDefaults = UserDefaults.standard
        switch indexPath.row {
        case 0:
            let heightIndex = userDefaults.bool(forKey: "heightMetrics") ? 0 : 1
            return SettingsCollectionViewCellViewModel(parameter: .height, index: heightIndex)
        case 1:
            let diameterIndex = userDefaults.bool(forKey: "diameterMetrics") ? 0 : 1
            return SettingsCollectionViewCellViewModel(parameter: .diameter, index: diameterIndex)
        case 2:
            let massIndex = userDefaults.bool(forKey: "massMetrics") ? 0 : 1
            return SettingsCollectionViewCellViewModel(parameter: .mass, index: massIndex)
        case 3:
            let payloadWeightIndex = userDefaults.bool(forKey: "payloadWeightMetrics") ? 0 : 1
            return SettingsCollectionViewCellViewModel(parameter: .payloadWeight, index: payloadWeightIndex)
        default:
            return nil
        }
    }
}
