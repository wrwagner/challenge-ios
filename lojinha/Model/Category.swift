//
//  Category.swift
//  lojinha
//
//  Created by Wagner Rodrigues on 26/06/2018.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let categoria = try? JSONDecoder().decode(Categoria.self, from: jsonData)

import Foundation

struct Category: Codable {
    let data: [DataCattegory]
}

struct DataCattegory: Codable {
    let descricao: String
    let id: Int
    let urlImagem: String
}
