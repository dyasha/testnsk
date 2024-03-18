//
//  CharacterListViewModel.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import Foundation

class CharacterListViewModel {

    var characterNames: [String] = []
    var description: [String] = []
    var imageUrls: [String] = []
    var reloadTableView: (() -> Void)?

    func request() {
        ApiClient.shared.fetchCats { breeds in
            for breed in breeds {
                self.characterNames.append(breed.name)
                self.description.append(breed.description)
                if let image = breed.image, let imageUrl = URL(string: image.url) {
                    self.imageUrls.append(imageUrl.absoluteString)
                } else {
                    print("Invalid image URL for \(breed.name)")
                }
            }
            self.reloadTableView?()
        }
    }

    func numberOfSection() -> Int {
        1
    }

    func numberOfRows(_ section: Int) -> Int {
        characterNames.count
    }
}
