//
//  FrutasTableViewCell.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 21/06/21.
//

import UIKit

class FrutasTableViewCell: UITableViewCell {

    @IBOutlet weak var imageFruta: UIImageView!
    @IBOutlet weak var nombreFruta: UILabel!
    
    func configurar(nombreImagen: String, nombreFruta: String) {
        
        imageFruta.image = UIImage(named: nombreImagen)
        self.nombreFruta.text = nombreFruta
        
    }
    
}
