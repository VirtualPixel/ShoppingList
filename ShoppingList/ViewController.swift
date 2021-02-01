//
//  ViewController.swift
//  ShoppingList
//
//  Created by Justin Wells on 1/29/21.
//

import UIKit

class ViewController: UITableViewController {

    var itemList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(resetList))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return itemList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        
        cell.textLabel?.text = itemList[indexPath.row]
        return cell
    }
    
    @objc func addItem(){
        let ac = UIAlertController(title: "Enter item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default){_ in
            if(ac.textFields?[0].text == ""){
                return
            } else{
                self.itemList.append(ac.textFields?[0].text ?? "How'd you do this")
                self.reloadTableView()
            }
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @objc func resetList(){
        itemList.removeAll(keepingCapacity: true)
        
        reloadTableView()
    }
    
    func reloadTableView(){
        tableView.reloadData()
    }

}

