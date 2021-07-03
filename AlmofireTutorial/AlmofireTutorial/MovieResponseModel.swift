//
//  MoviResponseModel.swift
//  AlmofireTutorial
//
//  Created by Israel Torres Alvarado on 02/07/21.
//

struct MovieResponseModel: Decodable {
    
    let title: String
    let urlImage: String
    let release_date: String
    let director: String
    let cast: [ActorResponseModel]
    
}

struct ActorResponseModel: Decodable {
    let name: String
    let character: String
}
