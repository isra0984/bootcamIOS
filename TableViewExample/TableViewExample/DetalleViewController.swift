//
//  DetalleViewController.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 24/06/21.
//

import UIKit

class DetalleViewController: UIViewController {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var txtDescripcion: UITextView!
    
    var fruta: Fruta?
    var verdura: Verdura?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let frt = fruta {
            
            imagen.image = UIImage(named: frt.nombreImagen)
            lblNombre.text = frt.nombre
            txtDescripcion.text = "aqui iria la descripcion de la fruta........"
            
        } else if let vrd = verdura {
                
            imagen.image = UIImage(named: vrd.nombreImagen)
            lblNombre.text = vrd.nombre
            txtDescripcion.text = "Aqui iria la descripcion de la verdura......."
        }
        
    }

}
