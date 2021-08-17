//
//  UniversityService.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 14.08.2021.
//

import Foundation
import FirebaseFirestore
import RealmSwift

class UniversityService: NSObject {
    
    static let shared = UniversityService()
    
    let realm = try! Realm()
    
    var universities = [University]()
    var favorites: Results<University>?
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
                    
//                    let university = University(name: name, department: department, city: city, language: language, minScore: minScore, placement: placement, quaota: quota, duration: duration, type: type)
                    let university = University()
                    university.name = name
                    university.department = department
                    university.city = city
                    university.language = language
                    university.minScore = minScore
                    university.placement = placement
                    university.quaota = quota
                    university.duration = duration
                    university.type = type
                    
                    self.universities.append(university)
                }
                
                DispatchQueue.main.async {
                    print("universities: \(self.universities)")
                    
                    completion(self.universities, nil)
                }
            }
        }
        
    }
    
//    func saveFavorites(viewModel: UniversityViewModel, completion: @escaping (Results<University>?, Error?) -> ()) {
        
    func saveFavorites(viewModel: UniversityViewModel) {
        
        //        var university = University(name: viewModel.name,
        //                                    department: viewModel.department,
        //                                    city: viewModel.city,
        //                                    language: viewModel.language,
        //                                    minScore: viewModel.minScore,
        //                                    placement: viewModel.placement,
        //                                    quaota: viewModel.quaota,
        //                                    duration: viewModel.duration,
        //                                    type: viewModel.type)
        
        let university = University()
        university.name = viewModel.name
        university.department = viewModel.department
        university.city = viewModel.city
        university.language = viewModel.language
        university.minScore = viewModel.minScore
        university.placement = viewModel.placement
        university.quaota = viewModel.quaota
        university.duration = viewModel.duration
        university.type = viewModel.type
        
        
        do {
            try realm.write({
                realm.add(university)
            })
//            completion(favorites, nil)
            
        } catch {
            print("Error while saving item to db \(error)")
//            completion(nil, error)
        }
        
    }
    
    func deleteFromFavorites(viewModel: UniversityViewModel) {
        let university = University()
        university.name = viewModel.name
        university.department = viewModel.department
        university.city = viewModel.city
        university.language = viewModel.language
        university.minScore = viewModel.minScore
        university.placement = viewModel.placement
        university.quaota = viewModel.quaota
        university.duration = viewModel.duration
        university.type = viewModel.type
        
        do {
            try realm.write {
                realm.delete(university)
            }
        } catch {
            print("Error while deleting a category \(error)")
        }
        
    }
    
    func loadFavorites() {
        
        // favorites = fetch from db
        favorites = realm.objects(University.self)
        
        print("Favorites: \(favorites)")
    }
}
