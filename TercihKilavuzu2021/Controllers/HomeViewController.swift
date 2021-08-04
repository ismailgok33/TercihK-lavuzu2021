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
    
    var universities : [University] = [University]()
    
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
        universities.append(University(name: "ODTÜ", department: "Elektrik Elektronik Mühendisliği", location: "Ankara", educationDuration: 4))
        universities.append(University(name: "TOBB", department: "Bilgisayar Mühendisliği", location: "Ankara", educationDuration: 4))
        universities.append(University(name: "Bilkent", department: "Makine Mühendisliği", location: "Ankara", educationDuration: 4))
        universities.append(University(name: "Boğaziçi", department: "Bilgisayar Mühendisliği", location: "İstanbul", educationDuration: 4))
        universities.append(University(name: "ODTÜ", department: "Endüstri Mühendisliği", location: "Ankara", educationDuration: 2))
    }


}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UniversityTableViewCell
        
        cell.university = universities[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("\(universities[indexPath.row].name) is tapped")
    }
    
    
}
