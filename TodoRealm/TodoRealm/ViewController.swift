//
//  ViewController.swift
//  TodoRealm
//
//  Created by Itou Shingo on 2020/05/04.
//  Copyright © 2020 Itou Shingo. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {
    
    
    

    var todoItems:Results<Todo>!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    func deleteTodo(at index: Int){
        let realm = try! Realm()
        try! realm.write{
            realm.delete(todoItems[index])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let object = todoItems[indexPath.row]
        cell.textLabel?.text = object.title
        
        return cell
    }
}

