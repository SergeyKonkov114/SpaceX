//
//  LaunchCollectionViewCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 08.04.2022.
//

import Foundation

class LaunchCollectionViewCellViewModel {
    
    private let launch: Launch
    
    var launchName: String {
        return launch.launchName
    }
    
    var launchDate: String {
        
        var dateStringUtc = launch.dateUtc
        dateStringUtc.removeLast(14)
        let dateString = dateStringUtc.components(separatedBy: "-")
        
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        dateComponents.day = Int(dateString[2])
        dateComponents.month = Int(dateString[1])
        dateComponents.year = Int(dateString[0])
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "d MMMM, yyyy"
        
        guard let date = calendar.date(from: dateComponents) else { return "-"}
        let formattingDate = dateFormatter.string(from: date)
        return formattingDate
    }
    
    var success: Bool? {
        return launch.success
    }
    
    init(launch: Launch) {
        self.launch = launch
    }
}
