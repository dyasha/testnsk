//
//  ApiClient.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

class RickAndMortyAPI {
    static let shared = RickAndMortyAPI()
    private let url = "https://rickandmortyapi.com/api/character"

    func fetchCharacterData(completion: @escaping ([CharacterList]) -> Void) {
        guard let url = URL(string: url) else {
            print("Неверный  URL")
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion([])
                return
            }
            do {
                let characterData = try JSONDecoder().decode(CharacterListData.self, from: data)
                let characters = characterData.results
                completion(characters)
            } catch {
                completion([])
            }
        }.resume()
    }
}

