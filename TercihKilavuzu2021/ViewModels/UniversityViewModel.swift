//
//  UniversityViewModel.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 11.08.2021.
//

import Foundation
import FirebaseFirestore

struct UniversityViewModel {
    let name : String
    let department : String
    let city : String
    let language : String
    let minScore : String
    let placement : String
    let quaota : String
    let duration : String
    let type : String
    var isFavorite : Bool
    
    init(with model: University) {
        self.name = model.name
        self.department = model.department
        self.city = model.city
        self.language = model.language
        self.minScore = model.minScore
        self.placement = model.placement
        self.quaota = model.quaota
        self.duration = model.duration
        self.type = model.type
        self.isFavorite = false
    }
}

