//
//  RecursosRepositorio.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 28/06/21.
//

import Foundation

class RecursosRepository {
    
    let urlServer: String = "https://run.mocky.io/v3/468070ea-a0ff-4f05-a3b9-4bb74a5ccb57"
    
    func obtenerRecursos(complationHandler: @escaping(_ result: ServiceResponseModel?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: urlServer) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, error in
            
            if let err = error {
                print(err.localizedDescription)
                complationHandler(nil, err)
            }
            
            if let dat = data {
                
                do {
                    
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(ServiceResponseModel.self, from: dat)
                    print(responseModel)
                    complationHandler(responseModel, nil)
                    
                } catch {
                    print(error.localizedDescription)
                    complationHandler(nil, error)
                }
                
            }
            
        }.resume()
        
    }
    
}
