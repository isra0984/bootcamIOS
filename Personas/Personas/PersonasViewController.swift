//
//  ViewController.swift
//  Personas
//
//  Created by Israel Torres Alvarado on 15/07/21.
//

import UIKit

class PersonasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var personasTableView: UITableView!
    
    var personas: [Persona] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        personasTableView.delegate = self
        personasTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let persona = personas[indexPath.row]
        cell.textLabel?.text = "Nombre: \(persona.nombre), edad: \(persona.edad)"
        return cell
    }
    
    @IBAction func abreNuevaPersona(_ sender: Any) {
        performSegue(withIdentifier: "abreNuevaPersona", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
        if let navigationController = segue.destination as? UINavigationController {
            
            if let nuevaPersonaVC = navigationController.viewControllers.first as? NuevaPersonaViewController {
                nuevaPersonaVC.delegate = self
            }
        
        }
        
    }
    
}

extension PersonasViewController: NuevaPersonaViewControllerDelegate {
    
    func guardarPersona(persona: Persona) {
        
        personas.append(persona)
        personasTableView.reloadData()
        
    }
    
}

