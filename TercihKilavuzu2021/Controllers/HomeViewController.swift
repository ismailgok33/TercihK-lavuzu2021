//
//  ViewController.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 4.08.2021.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    let realm = try! Realm()
    
    let cellId = "cellId"
    let tableView = UITableView()
    
    let searchController = UISearchController()
    var universityViewModels = [UniversityViewModel]()
//    var favorites : Results<UniversityViewModel>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UniversityTableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.rowHeight = 250
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Üniversite arayınız..."
        navigationItem.searchController = searchController
        
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    fileprivate func fetchData() {
        UniversityService.shared.fetchUniversities { universities, error in
            if let err = error {
                print("Failed to fetch courses: \(err)")
                return
            }
            
            self.universityViewModels = universities?.map({ return UniversityViewModel(with: $0) }) ?? []
            
            print("universityViewModels: \(self.universityViewModels)")
            
            self.tableView.reloadData()
        }
    }
    
    // Load items from db
    private func loadAllUniversities() {
        //Load university data from Firebase here
        tableView.reloadData()
    }


}


extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universityViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UniversityTableViewCell
        let viewModel = universityViewModels[indexPath.row]
        
        cell.universityViewModel = viewModel
//        cell.university = universities[indexPath.row]
//        cell.configure(with: UniversityViewModel(with: model))
        cell.delegate = self
         
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        print("\(universityViewModels[indexPath.row].name) is tapped")
//    }
    
    
}



extension HomeViewController : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            
            // Filter universities from Firebase here. universities = universities.filter.....
            
            tableView.reloadData()
        }
        else {
            loadAllUniversities()
        }
        
        
    }

}

extension HomeViewController: UniversityTableViewCellDelegate {
    func universityTableViewCell(_ cell: UniversityTableViewCell, didTapWith viewModel: UniversityViewModel) {
        
        let service = UniversityService.shared
        
        print(viewModel.isFavorite)
        
        if viewModel.isFavorite {
            // Save cell to favorites
//            do {
//                try realm.write({
//                    realm.add(viewModel)
//                })
//            } catch {
//                print("Error while saving item to db \(error)")
//            }
            service.saveFavorites(viewModel: viewModel)
        }
        else {
//            do {
//                try realm.write {
//                    realm.delete(viewModel)
//                }
//            } catch {
//                print("Error while deleting a category \(error)")
//            }
            
            service.deleteFromFavorites(viewModel: viewModel)
        }
        
        service.loadFavorites()
        
//        tableView.reloadData()
    }
}
