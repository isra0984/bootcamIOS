//
//  MovieRepository.swift
//  AlmofireTutorial
//
//  Created by Israel Torres Alvarado on 05/07/21.
//

import Foundation
import Alamofire

//Plantilla que clases y estructuras pueden implemenar
//Normalmeten se definen en ellos propiedades y metodos
protocol MovieRepository {
  func fetchMovieInfo(complationHandler: @escaping(_ result: MovieResponseModel?, _ error: Error?) -> Void)
}

final class MovieRepositoryImp: MovieRepository {
    
    let url = "https://run.mocky.io/v3/469c8e68-83f3-4df2-9f7a-cefe6fe19d0e"
    
    func fetchMovieInfo(complationHandler: @escaping(_ result: MovieResponseModel?, _ error: Error?) -> Void) {
        
        AF.request(url).responseDecodable(of: MovieResponseModel.self) { response in
        
            switch response.result {
            case .success(let movie):
                complationHandler(movie, nil)
            case .failure(let error):
                complationHandler(nil, error)
            }
            
        }
    
    }
    
}
