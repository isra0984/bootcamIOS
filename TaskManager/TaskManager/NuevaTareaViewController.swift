//
//  NuevaTareaViewController.swift
//  NuevaTareaViewController
//
//  Created by Israel Torres Alvarado on 26/07/21.
//

import UIKit

class NuevaTareaViewController: UIViewController {

    @IBOutlet weak var txtTarea: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func guardarTarea(_ sender: Any) {
        
        guard let text = txtTarea.text,
              !text.isEmpty else {
                  return
              }
        
        let tarea = Tarea(id: NSUUID().uuidString, descripcion: text)
        
        guard let navigation = self.navigationController,
              let listVC = navigation.viewControllers.first as? ViewController  else {
            return
        }
        
        listVC.guardarTarea(tarea: tarea)
        
        navigation.popViewController(animated: true)
        
    }
    
}
