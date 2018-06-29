//
//  ProductID.swift
//  lojinha
//
//  Created by Wagner Rodrigues on 26/06/2018.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let productID = try? JSONDecoder().decode(ProductID.self, from: jsonData)

import Foundation

struct ProductID: Codable {
    let categoria: Category
    let descricao: String
    let id: Int
    let nome: String
    let precoDe, precoPor: Int
    let urlImagem: String
}


