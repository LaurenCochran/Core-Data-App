//
//  ViewController.swift
//  ToDo
//
//  Created by Lauren on 2019-04-19.
//  Copyright © 2019 Lauren Cochran. All rights reserved.
//

import UIKit
import CoreData

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var toDoText: UITextField!
    
    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var descriptionText: UITextField!
    
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        do{
            tasks = try managedContext.fetch(fetchRequest)
            
            toDoTableView.reloadData()
        }catch{
            print("Couldn't fetch")
        }
        
    }
    
    @IBAction func saveTask(_ sender: UIButton) {
        let toDo = toDoText.text
        let summary = descriptionText.text
        
        if let task = Task(summary: summary, toDo: toDo){
            do{
               let managedContext = task.managedObjectContext
                
               try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            }catch{
               print("The task couldn't be saved")
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        let task = tasks[indexPath.row]
        
        cell.textLabel?.text = task.toDo
        cell.detailTextLabel?.text = task.summary
        
        return cell
    }
    
}

