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
        
        db.collection("universities").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(nil, err)
                return
            } else {
                for document in querySnapshot!.documents {
                    // Get data from db to local variables
                    let name = document["name"] as? String ?? ""
                    let department = document["department"] as? String ?? ""
                    let city = document["city"] as? String ?? ""
                    let language = document["language"] as? String ?? ""
                    let minScore = document["minScore"] as? String ?? ""
                    let placement = document["placement"] as? String ?? ""
                    let quota = document["quota"] as? String ?? ""
                    let duration = document["duration"] as? String ?? ""
                    let type = document["type"] as? String ?? ""
                    
                    let university = University(name: name, department: department, city: city, language: language, minScore: minScore, placement: placement, quaota: quota, duration: duration, type: type)
                    
                    self.universities.append(university)
                }
                
                DispatchQueue.main.async {
                    print("universities: \(self.universities)")

                    completion(self.universities, nil)
                }
            }
        }
        
//        db.collection("universities").addSnapshotListener { [weak self] querySnapshot, error in
//
//            guard let documents = querySnapshot?.documents, error == nil else {
//                print("No documents")
//                completion(nil, error)
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
//                return university
//            }
//        }
        
       
        
        
    }
}
