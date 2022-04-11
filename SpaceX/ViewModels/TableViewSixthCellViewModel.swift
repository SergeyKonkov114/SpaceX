//
//  TableViewSixthCellViewModel.swift
//  SpaceX
//
//  Created by Сергей Коньков on 04.04.2022.
//

import Foundation

class TableViewSixthCellViewModel: TableViewCellViewModelType {
    
//    let buttonAction: (() -> ())?
    
//    init(buttonAction: (() -> ())?) {
//        self.buttonAction = buttonAction
//    }
    
    let rocket: Rocket
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
}
