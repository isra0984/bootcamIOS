//
//  ViewController.swift
//  MVCApplication
//
//  Created by Israel Torres Alvarado on 07/06/21.
//

import UIKit

class ViewController: UIViewController {

    //Representacion a nivel codigo de un componente de vista
    @IBOutlet weak var labelSaludo: UILabel!
    let modelo = ModeloSaludo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSaludo.text = modelo.obtenerSaludo()
        
    }
    
}

