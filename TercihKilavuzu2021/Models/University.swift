//
//  University.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 4.08.2021.
//

import Foundation

struct University: Identifiable {
    let id : String = UUID().uuidString
    let name : String
    let department : String
    let city : String
    let language : String
    let minScore : String
    let placement : String
    let quaota : String
    let duration : String
    let type : String
    
}
