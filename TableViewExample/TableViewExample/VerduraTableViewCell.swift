//
//  VerduraTableViewCell.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 23/06/21.
//

import UIKit

class VerduraTableViewCell: UITableViewCell {

    //1.- Crear objetos visuales
    lazy var labelNombre: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    lazy var imagenVerdura: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //2.- agregar objetos visuales a la super vista
        addSubview(labelNombre)
        addSubview(imagenVerdura)
        
        //3.- agregar constraints pragramaticos
        NSLayoutConstraint.activate([
            //Imagen
            imagenVerdura.widthAnchor.constraint(equalToConstant: 56),
            imagenVerdura.heightAnchor.constraint(equalToConstant: 56),
            imagenVerdura.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            imagenVerdura.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            //label
            labelNombre.rightAnchor.constraint(equalTo: imagenVerdura.leftAnchor, constant: -10),
            labelNombre.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            labelNombre.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            labelNombre.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurar(model: Verdura) {
        labelNombre.text = model.nombre
        imagenVerdura.image = UIImage(named: model.nombreImagen)
    }
    
}
