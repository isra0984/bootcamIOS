//
//  SplashViewController.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 25/06/21.
//

import UIKit

class SplashViewController: UIViewController {

    var frutas: [Fruta] = []
    var verduras: [Verdura] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repositorio = RecursosRepository()
        repositorio.obtenerRecursos { response, error in
            
            if let err = error {
                print(err.localizedDescription)
            }
            
            if let res = response {
                
                let frutasService = res.frutas
                for fruta in frutasService {
                    
                    let frutaView = Fruta(nombre: fruta.nombre, nombreImagen: fruta.urlImage)
                    self.frutas.append(frutaView)
                    
                }
                
                let verdurasService = res.verduras
                for verdura in verdurasService {
                    
                    let verduraView = Verdura(nombre: verdura.nombre, nombreImagen: verdura.urlImage)
                    self.verduras.append(verduraView)
                
                }
                
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "iralistado", sender: nil)
                }
                
            }
            
            
        }
    
    }
    
    func obtenerFrutasDelServidor() {
        
        let when = DispatchTime.now() + 5.0
        DispatchQueue.main.asyncAfter(deadline: when) {
            
            let manzana = Fruta(nombre: "Manzana", nombreImagen: "manzana")
            let fresa = Fruta(nombre: "Fresa", nombreImagen: "fresa")
            let mango = Fruta(nombre: "Mango", nombreImagen: "mango")
            let melon = Fruta(nombre: "Melon", nombreImagen: "melon")
            let sandia = Fruta(nombre: "Sandia", nombreImagen: "sandia")
                    
            self.frutas = [manzana, fresa, mango, melon, sandia]
            
            let espinaca = Verdura(nombre: "Espinacas", nombreImagen: "espinaca")
            let lechuga = Verdura(nombre: "Lechuga", nombreImagen: "lechuga")
            let chile = Verdura(nombre: "Chile", nombreImagen: "chile")
            let pepino = Verdura(nombre: "Pepino", nombreImagen: "pepino")
            let jitomate = Verdura(nombre: "Jitomate", nombreImagen: "jitomate")
            
            self.verduras = [espinaca, lechuga, chile, pepino, jitomate]
            
            self.performSegue(withIdentifier: "iralistado", sender: nil)
            
        }
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let listadoViewController = segue.destination as? ListadoFrutasViewController {
            
            listadoViewController.frutas = frutas
            listadoViewController.verduras = verduras
            
        }

    }
   

}
