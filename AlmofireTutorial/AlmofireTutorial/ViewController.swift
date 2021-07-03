//
//  ViewController.swift
//  AlmofireTutorial
//
//  Created by Israel Torres Alvarado on 02/07/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://run.mocky.io/v3/469c8e68-83f3-4df2-9f7a-cefe6fe19d0e"
        
        AF.request(url).response { response in
            
            //Peticion al servidor
            dump(response.request)
            
            //respuesta del servidor
            dump(response.response)
            
            //obtener datos binarios
            dump(response.data)
            
            //obtener error de la peticion
            dump(response.error)
            
        }
        
        AF.request(url).responseDecodable(of: MovieResponseModel.self) { response in
            
            debugPrint("Response: \(response)")
            switch response.result {
            case .success(let movie):
                debugPrint("Pelicula: \(movie)")
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
            
    }

}

