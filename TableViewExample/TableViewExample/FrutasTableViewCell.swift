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
        
        self.nombreFruta.text = nombreFruta
        dowloadImage(urlImage: nombreImagen)
        
    }
    
    func dowloadImage(urlImage: String) {
        
        guard let url = URL(string: urlImage) else {
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, _ , error in
            
            if let existError = error {
                self.imageFruta.image = UIImage(named: "manzana")
                print(existError.localizedDescription)
            }
            
            if let responseData = data {
                
                DispatchQueue.main.async {
                    self.imageFruta.image = UIImage(data: responseData)
                }
                
            }
            
        }.resume()
        
    }
    
}
