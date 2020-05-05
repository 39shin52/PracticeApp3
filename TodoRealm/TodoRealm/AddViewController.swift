//
//  AddViewController.swift
//  TodoRealm
//
//  Created by Itou Shingo on 2020/05/04.
//  Copyright © 2020 Itou Shingo. All rights reserved.
//

import UIKit
import RealmSwift
class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textBox.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButton(_ sender: Any) {
        
        let realm = try! Realm()
        let todo = Todo()
        todo.title = textBox.text!
        try! realm.write{
            realm.add(todo)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    func  textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textBox.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
