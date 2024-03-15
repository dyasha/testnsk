//
//  CharacterListModel.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import Foundation

struct CharacterListData: Decodable {
    let results: [CharacterList]
}

struct CharacterList: Decodable {
    let name: String
    let image: String
}
