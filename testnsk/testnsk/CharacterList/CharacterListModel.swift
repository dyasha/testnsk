//
//  CharacterListModel.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import Foundation

struct Breed: Decodable {

    let name: String
    let description: String
    let image: Image?

    struct Image: Decodable {

        let url: String
    }

    enum CodingKeys: String, CodingKey {
        case name, description, image
    }
}
