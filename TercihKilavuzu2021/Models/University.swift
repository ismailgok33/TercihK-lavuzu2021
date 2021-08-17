//
//  University.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 4.08.2021.
//

import Foundation
import RealmSwift

class University: Object, Identifiable {
    @objc dynamic var id : String = UUID().uuidString
    @objc dynamic var name : String = ""
    @objc dynamic var department : String = ""
    @objc dynamic var city : String = ""
    @objc dynamic var language : String = ""
    @objc dynamic var minScore : String = ""
    @objc dynamic var placement : String = ""
    @objc dynamic var quaota : String = ""
    @objc dynamic var duration : String = ""
    @objc dynamic var type : String = ""
    
}
