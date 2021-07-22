//
//  NuevaPersonaViewController.swift
//  Personas
//
//  Created by Israel Torres Alvarado on 15/07/21.
//

import UIKit

protocol NuevaPersonaViewControllerDelegate {
    func guardarPersona(persona: Persona)
}

class NuevaPersonaViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    
    var delegate: NuevaPersonaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func guardar(_ sender: Any) {
        
        guard let nombre = txtNombre.text,
              let edad = txtEdad.text,
              !nombre.isEmpty, !edad.isEmpty else {
            return
        }
        
        let persona = Persona(nombre: nombre, edad: Int(edad) ?? 0)
        delegate?.guardarPersona(persona: persona)
        dismiss(animated: true, completion: nil)
        
    }
    
}
