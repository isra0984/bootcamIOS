//
//  ViewController.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 17/06/21.
//

import UIKit

class ListadoFrutasViewController: UIViewController {
    
    @IBOutlet weak var listadoFrutas: UITableView!
        
    var frutas: [Fruta] = []
    var verduras: [Verdura] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listadoFrutas.dataSource = self
        listadoFrutas.delegate = self
        //registrar la celda
        
        // Ubicacion de carpetas en base una clase
        let bundle = Bundle(for: FrutasTableViewCell.self)
        let nib = UINib(nibName: "FrutasTableViewCell", bundle: bundle)
        listadoFrutas.register(nib, forCellReuseIdentifier: "cellFrutas")
        
        listadoFrutas.register(VerduraTableViewCell.self, forCellReuseIdentifier: "cellVerdura")
        
    }

}

// MARK: Navigation
extension ListadoFrutasViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier.elementsEqual("iradetalle") {
            
            if let detalleViewController = segue.destination as? DetalleViewController {
                
                if let fruta = sender as? Fruta {
                    detalleViewController.fruta = fruta
                } else if let verdura = sender as? Verdura {
                    detalleViewController.verdura = verdura
                }
                
            }

        }
        
    }
    
    
}

// MARK: UITableViewDelegate
extension ListadoFrutasViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
        if indexPath.section == 0 { //Seccion Frutas
            
            let fruta = frutas[indexPath.row]
            print("Nombre fruta: \(fruta.nombre)")
            performSegue(withIdentifier: "iradetalle", sender: fruta)
            
        } else { //Seccion de verduras
            
            let verdura = verduras[indexPath.row]
            print("Nombre verdura: \(verdura.nombre)")
            performSegue(withIdentifier: "iradetalle", sender: verdura)
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let labelTitle = UILabel()
        labelTitle.backgroundColor = .green
        labelTitle.textColor = .systemPink
        
        labelTitle.text = section == 0 ? "FRUTAS" : "VERDURAS"
        
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
        labelTitle.text = "Aqui termina la seccion de \(section == 0 ? "frutas" : "verduras")"
        labelTitle.textAlignment = .center
        return labelTitle
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
}
// MARK: UITableViewDataSource
extension ListadoFrutasViewController: UITableViewDataSource {
    
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
        
        if indexPath.section == 0 {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cellFrutas", for: indexPath) as? FrutasTableViewCell {
                
                let fruta = frutas[indexPath.row]
                cell.configurar(nombreImagen: fruta.nombreImagen, nombreFruta: fruta.nombre)
                
                return cell
                
            } else {
                return UITableViewCell()
            }
            
        } else {
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cellVerdura") as? VerduraTableViewCell {
                
                let verdura = verduras[indexPath.row]
                cell.configurar(model: verdura)
                
                return cell
                
            } else {
                return UITableViewCell()
            }
            
        }
        
    }
    
}



