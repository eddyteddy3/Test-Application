//
//  ViewController.swift
//  Test Application
//
//  Created by Mouzzam Tahir on 10/09/2021.
//

import UIKit

//Sections Structure
struct Objects {
    var sectionName: String
    var items: [Any]
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    let customCellIdentifier = "CellID"
    
    var objectsArray = [Objects]()
    
    var arrayDictionary = ["Section 1 Name": ["1","2","3","4","5","6","7","8"],
                          "Section 2": ["a", "b", "c", "d", "e", "f", "g", "h"]]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        feedData()
    }
    
    //Feeding the data to Structure Array
    func feedData() {
        for (key, items) in arrayDictionary {
            objectsArray.append(Objects(sectionName: key, items: items))
        }
    }
    
    
    //Initializing the table views
    func initializeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibFile = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibFile, forCellReuseIdentifier: customCellIdentifier)
    }

}

//MARK: - Delegates
extension ViewController: UITableViewDelegate,
                          UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectsArray[section].sectionName
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier, for: indexPath) as! TableViewCell
    
        let itemText = objectsArray[indexPath.section].items[indexPath.row]
        
        cell.add((itemText as? String) ?? "NIL")
        
        return cell
    }
}
