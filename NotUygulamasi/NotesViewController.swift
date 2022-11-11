//
//  NotesViewController.swift
//  NotUygulamasi
//
//  Created by Zeynep Sevgi on 9.11.2022.
//

import UIKit

class NotesViewController: UIViewController,UITableViewDataSource {
    
    private let table: UITableView={
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Notes"
        view.addSubview(table)
        table.dataSource = self
        navigationItem.rightBarButtonItem=UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(didTapAdd) )
        
    }
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Note", message: "Enter new to do notes list", preferredStyle: .alert)
        alert.addTextField{ field in
            field.placeholder = "Enter item..."
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default,handler:{ [weak self] 
            (_)in
            if let field = alert.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    // enter new to do list item
                    //print(text)
                    
                    DispatchQueue.main.async{
                    self?.items.append(text)
                    self?.table.reloadData()
                    }
                    
                }
            }
        }))
        
        present(alert,animated: true)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame=view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell

    }
    

   
}
