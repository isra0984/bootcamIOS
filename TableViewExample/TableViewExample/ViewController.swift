//
//  ViewController.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 17/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listadoFrutas: UITableView!
    
//    var frutas: [String] = ["Manzana","Fresa","Mango","Melon","Sandia"]
    
    var frutas: [Fruta] = []
    var verduras: [Verdura] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listadoFrutas.dataSource = self
        listadoFrutas.delegate = self
        //registrar la celda
        let bundle = Bundle(for: FrutasTableViewCell.self)
        let nib = UINib(nibName: "FrutasTableViewCell", bundle: bundle)
        listadoFrutas.register(nib, forCellReuseIdentifier: "cellFrutas")
        
        let manzana = Fruta(nombre: "Manzana", nombreImagen: "manzana")
        let fresa = Fruta(nombre: "Fresa", nombreImagen: "fresa")
        let mango = Fruta(nombre: "Mango", nombreImagen: "mango")
        let melon = Fruta(nombre: "Melon", nombreImagen: "melon")
        let sandia = Fruta(nombre: "Sandia", nombreImagen: "sandia")
                
        frutas = [manzana, fresa, mango, melon, sandia]
        
        let espinaca = Verdura(nombre: "Espinacas", nombreImagen: "espinaca")
        let lechuga = Verdura(nombre: "Lechuga", nombreImagen: "lechuga")
        let chile = Verdura(nombre: "Chile", nombreImagen: "Chile")
        let pepino = Verdura(nombre: "Pepino", nombreImagen: "pepino")
        let jitomate = Verdura(nombre: "Jitomate", nombreImagen: "jitomate")
        
        verduras = [espinaca, lechuga, chile, pepino, jitomate]
        
    }

}
// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "FRUTAS"
//    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let labelTitle = UILabel()
        labelTitle.backgroundColor = .green
        labelTitle.textColor = .systemPink
        labelTitle.text = "FRUTAS"
        labelTitle.textAlignment = .center
        return labelTitle
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let labelTitle = UILabel()
        labelTitle.backgroundColor = .black
        labelTitle.textColor = .white
        labelTitle.text = "Aqui termina la seccion de frutas"
        labelTitle.textAlignment = .center
        return labelTitle
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
}
// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return frutas.count
        } else {
            return verduras.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellFrutas", for: indexPath) as? FrutasTableViewCell {
            
            let fruta = frutas[indexPath.row]
            cell.configurar(nombreImagen: fruta.nombreImagen, nombreFruta: fruta.nombre)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }
    
}



