//
//  Banner.swift
//  lojinha
//
//  Created by Wagner Rodrigues on 26/06/2018.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation

struct Banner: Codable {
    let data: [DataBanner]
}

struct DataBanner: Codable {
    let id: Int
    let linkURL: String
    let urlImagem: String

    enum CodingKeys: String, CodingKey {
        case id
        case linkURL = "linkUrl"
        case urlImagem
    }
}

// To parse the JSON, add this file to your project and do:
//
//   let banner = try? JSONDecoder().decode(Banner.self, from: jsonData)
