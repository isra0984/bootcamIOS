//
//  ServiceResponseModel.swift
//  TableViewExample
//
//  Created by Israel Torres Alvarado on 29/06/21.
//

struct ServiceResponseModel: Codable {
    let frutas: [FrutaResponseModel]
    let verduras: [VerduraResponseModel]
}
