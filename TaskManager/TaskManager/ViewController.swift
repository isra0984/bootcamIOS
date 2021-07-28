//
//  ViewController.swift
//  TaskManager
//
//  Created by Israel Torres Alvarado on 26/07/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tareasTableView: UITableView!
    
    var tareas: [Tarea] = []
    var tasks: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tareasTableView.dataSource = self
                
    }
    
    func guardarTarea(tarea: Tarea) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: manageContext)
        let task = NSManagedObject(entity: entity!, insertInto: manageContext)
        
        task.setValue(tarea.id, forKey: "id")
        task.setValue(tarea.descripcion, forKey: "title")
        
        do {
            
            try manageContext.save()
            tasks.append(task)
            tareasTableView.reloadData()
            
        } catch {
            print(error.localizedDescription)
        }
    
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.value(forKey: "title") as? String
        
        return cell
   
    }
    
}

