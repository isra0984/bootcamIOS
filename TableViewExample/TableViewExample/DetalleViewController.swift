//
//  DetalleViewController.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 24/06/21.
//

import UIKit

class DetalleViewController: UIViewController {

    @IBOutlet weak var loaderImage: ImageLoader!
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var txtDescripcion: UITextView!
    
    var fruta: Fruta?
    var verdura: Verdura?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let frt = fruta {
            
            lblNombre.text = frt.nombre
            txtDescripcion.text = "aqui iria la descripcion de la fruta........"
            
            guard let url = URL(string: frt.nombreImagen) else {
                return
            }
            
            loaderImage.loadImageWithUrl(url)
            
            
        } else if let vrd = verdura {
                
            lblNombre.text = vrd.nombre
            txtDescripcion.text = "Aqui iria la descripcion de la verdura......."
            
            guard let url = URL(string: vrd.nombreImagen) else {
                return
            }
            
            loaderImage.loadImageWithUrl(url)
            
        }
        
    }
    
}
