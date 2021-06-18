//
//  LoginViewController.swift
//  LoginExample
//
//  Created by Israel Torres Alvarado on 15/06/21.
//

import UIKit

class LoginViewController: UIViewController {

    let userDefaults = UserDefaults.standard
    //Codigo duro (Simulando los datos del usuario)
    let correo = "israeltorres27@gmail.com"
    let contraseña = "123456789"
    let nameStorage = "Israel Torres"
    
    @IBOutlet weak var txtCorreoElectronico: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let nombre = userDefaults.object(forKey: "nombre") as? String {
            performSegue(withIdentifier: "irAHome", sender: nombre)
        }
        
    }
    
    @IBAction func IniciarSesion(_ sender: UIButton) {
            
        if txtCorreoElectronico.text == correo && txtContraseña.text == contraseña {
            
            performSegue(withIdentifier: "irAHome", sender: nameStorage)
            guardaUsuario()
            
        } else {
            
            let alert = UIAlertController(title: "Error", message: "Ingresa un usuario valido", preferredStyle: .alert)
            let accioncerrar = UIAlertAction(title: "Enterado", style: .default)
            
            alert.addAction(accioncerrar)
            
            present(alert, animated: true)
            
        }
        
    }
    
    func guardaUsuario() {
        
        userDefaults.setValue(nameStorage, forKey: "nombre")
        userDefaults.setValue(contraseña, forKey: "contrasena")
        userDefaults.setValue(correo, forKey: "correo")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "irAHome",
           let homeViewController = segue.destination as? HomeViewController,
           let nombre = sender as? String {
            
            homeViewController.name = nombre
            
        }

    }

}
