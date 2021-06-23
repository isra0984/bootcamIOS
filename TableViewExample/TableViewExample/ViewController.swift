//
//  ViewController.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 17/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listadoFrutas: UITableView!
    
    var frutas: [String] = ["Manzana","Fresa","Mango","Melon","Sandia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listadoFrutas.dataSource = self
        //registrar la celda
        let bundle = Bundle(for: FrutasTableViewCell.self)
        let nib = UINib(nibName: "FrutasTableViewCell", bundle: bundle)
        listadoFrutas.register(nib, forCellReuseIdentifier: "cellFrutas")
        
    }

}
// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frutas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("seccion: \(indexPath.section) y fila: \(indexPath.row)")
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellFrutas", for: indexPath) as? FrutasTableViewCell {
            
            cell.configurar(nombreImagen: "", nombreFruta: frutas[indexPath.row])
            
            return cell
        } else {
            return UITableViewCell()
        }
        
    
//        let cell = UITableViewCell()
//        let fruta = frutas[indexPath.row]
//        cell.textLabel?.text = fruta
//        return cell
    
    }
    
}



