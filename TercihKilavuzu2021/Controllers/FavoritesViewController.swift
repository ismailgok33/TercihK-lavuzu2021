//
//  FavoritesViewController.swift
//  TercihKilavuzu2021
//
//  Created by İsmail on 4.08.2021.
//

import UIKit

class FavoritesViewController: UIViewController {

    let cellId = "cellId"
    let tableView = UITableView()
    
    var favorites : [University] = [University]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UniversityTableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.rowHeight = 200
        
        createDummyUniversities()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func createDummyUniversities() {
        favorites.append(University(name: "ODTÜ", department: "Elektrik Elektronik Mühendisliği", location: "Ankara", educationDuration: 4))
        favorites.append(University(name: "TOBB", department: "Bilgisayar Mühendisliği", location: "Ankara", educationDuration: 4))
        favorites.append(University(name: "Bilkent", department: "Makine Mühendisliği", location: "Ankara", educationDuration: 4))
    }
    

}

extension FavoritesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UniversityTableViewCell
        
        cell.university = favorites[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("\(favorites[indexPath.row].name) is tapped")
    }
    
    
}
