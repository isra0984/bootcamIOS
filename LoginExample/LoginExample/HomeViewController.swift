//
//  HomeViewController.swift
//  LoginExample
//
//  Created by Israel Torres Alvarado on 15/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblBienvenido: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let minombre = name else {
            return
        }
        
        lblBienvenido.text = "Bienvenido \(minombre)"
    
    }
    
    @IBAction func cerrarSesion(_ sender: UIButton) {
        
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "nombre")
        userDefault.removeObject(forKey: "correo")
        userDefault.removeObject(forKey: "contresena")
        dismiss(animated: true)
        
    }
    
}
