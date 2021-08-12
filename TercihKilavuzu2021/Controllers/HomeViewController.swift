//
//  ViewController.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 4.08.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    let cellId = "cellId"
    let tableView = UITableView()
    
    let searchController = UISearchController()
    var universities : [University] = [University]()
    
//    private var universityVm = UniversityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UniversityTableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.rowHeight = 200
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Üniversite arayınız..."
        navigationItem.searchController = searchController
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
   
    
    // Load items from db
    private func loadAllUniversities() {
        //Load university data from Firebase here
        tableView.reloadData()
    }


}


extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UniversityTableViewCell
        let model = universities[indexPath.row]
        
//        cell.university = universities[indexPath.row]
        cell.configure(with: UniversityViewModel(with: model))
        cell.delegate = self
         
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("\(universities[indexPath.row].name) is tapped")
    }
    
    
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
        
        if viewModel.isFavorite {
            // Save cell to favorites
        }
    }
}
