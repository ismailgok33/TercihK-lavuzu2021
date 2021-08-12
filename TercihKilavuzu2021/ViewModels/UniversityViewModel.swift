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
        name = model.name
        department = model.department
        city = model.city
        language = model.language
        minScore = model.minScore
        placement = model.placement
        quaota = model.quaota
        duration = model.duration
        type = model.type
        isFavorite = false
    }
}
//    var universities = [University]()
//    private var db = Firestore.firestore()
    
//    func fetchData() -> [University] {
//        db.collection("universities").addSnapshotListener { [weak self] querySnapshot, error in
//            guard let documents = querySnapshot?.documents, error == nil else {
//                print("No documents")
//                return
//            }
//
//            self?.universities = documents.map { quertDocumentSnapshot -> University in
//                let data = quertDocumentSnapshot.data()
//
//                // Get data from db to local variables
//                let name = data["name"] as? String ?? ""
//                let department = data["department"] as? String ?? ""
//                let city = data["city"] as? String ?? ""
//                let language = data["language"] as? String ?? ""
//                let minScore = data["minScore"] as? String ?? ""
//                let placement = data["placement"] as? String ?? ""
//                let quota = data["quota"] as? String ?? ""
//                let duration = data["duration"] as? String ?? ""
//                let type = data["type"] as? String ?? ""
//
//                let university = University(name: name, department: department, city: city, language: language, minScore: minScore, placement: placement, quaota: quota, duration: duration, type: type)
//                print("university: \(university)")
//                return university
//            }
//        }
//
//        return universities
//    }

