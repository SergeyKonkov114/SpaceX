//
//  TableViewThirdCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation

class TableViewThirdCellViewModel: TableViewCellViewModelType {
    
    let rocket: Rocket
    
    var firstFlight: String {
        let dateString = rocket.firstFlight.components(separatedBy: "-")
        
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
    
    var country: String {
        return NSLocalizedString(rocket.country, comment: "")
    }
    
    var costPerLaunch: String {
        return "$\(rocket.costPerLaunch / 1_000_000) млн"
    }
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
}
