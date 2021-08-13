//
//  UniversityService.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 14.08.2021.
//

import Foundation
import FirebaseFirestore

class UniversityService: NSObject {
    
    static let shared = UniversityService()
    
    var universities = [University]()
    private var db = Firestore.firestore()
    
    func fetchUniversities(completion: @escaping ([University]?, Error?) -> ()) {
        // fetch data from firestore here
        
        
        
        db.collection("universities").addSnapshotListener { [weak self] querySnapshot, error in
            guard let documents = querySnapshot?.documents, error == nil else {
                print("No documents")
                return
            }
            
            self?.universities = documents.map { quertDocumentSnapshot -> University in
                let data = quertDocumentSnapshot.data()
                
                // Get data from db to local variables
                let name = data["name"] as? String ?? ""
                let department = data["department"] as? String ?? ""
                let city = data["city"] as? String ?? ""
                let language = data["language"] as? String ?? ""
                let minScore = data["minScore"] as? String ?? ""
                let placement = data["placement"] as? String ?? ""
                let quota = data["quota"] as? String ?? ""
                let duration = data["duration"] as? String ?? ""
                let type = data["type"] as? String ?? ""
                
                let university = University(name: name, department: department, city: city, language: language, minScore: minScore, placement: placement, quaota: quota, duration: duration, type: type)
                print("university: \(university)")
                return university
            }
        }
        
        
    }
}
