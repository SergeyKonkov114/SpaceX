//
//  SettingsControllerViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 11.04.2022.
//

import Foundation

class SettingsControllerViewModel {
    
    
    func settingsCollectionViewCellViewModel(forIndexPath indexPath: IndexPath) -> SettingsCollectionViewCellViewModel? {
        switch indexPath.row {
        case 0:
            return SettingsCollectionViewCellViewModel(parameterName: "Высота", parameterMetrics: ["m", "ft"])
        case 1:
            return SettingsCollectionViewCellViewModel(parameterName: "Диаметр", parameterMetrics: ["m", "ft"])
        case 2:
            return SettingsCollectionViewCellViewModel(parameterName: "Масса", parameterMetrics: ["kg", "lb"])
        case 3:
            return SettingsCollectionViewCellViewModel(parameterName: "Полезная нагрузка", parameterMetrics: ["kg", "lb"])
        default:
            return nil
        }
    }
}
