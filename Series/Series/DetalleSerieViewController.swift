//
//  DetalleSerieViewController.swift
//  DetalleSerieViewController
//
//  Created by Israel Torres Alvarado on 03/08/21.
//

import UIKit

class DetalleSerieViewController: UIViewController {

    @IBOutlet weak var imagenSerie: UIImageView!
    @IBOutlet weak var lblName: UILabel!

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        return table
    }()
    
    var serie: String = ""
    
    var actores: [String] = ["Pepe pica", "Cantinflas", "Capulina"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagenSerie.image = UIImage(named: serie)
        lblName.text = serie
    }
    
    @IBAction func mostrarActores(_ sender: Any) {
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 50),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    
    }

}

extension DetalleSerieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = actores[indexPath.row]
        
        return cell
    }

}
