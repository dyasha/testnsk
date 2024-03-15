//
//  FavoritesViewModel.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

struct FavoritePerson: Codable {
    let name: String
    let imageUrl: Data?
}

//class FavoritesViewModel {
//    static let shared = FavoritesViewModel()
//
//    var favoritePersons: [Person] = []
//
//    var reloadData: (() -> Void)?
//
//    func addFavoritePerson(_ person: Person) {
//        favoritePersons.append(person)
//        reloadData?()
//    }
//
//    func removeFavoritePerson(withName name: String) {
//        if let index = favoritePersons.firstIndex(where: { $0.name == name }) {
//            favoritePersons.remove(at: index)
//            reloadData?()
//        }
//    }
//
//    func numberOfFavoritePersons(_ section: Int) -> Int {
//        return FavoritesViewModel.shared.favoritePersons.count
//    }
//
//    func isPersonFavorite(withName name: String) -> Bool {
//        return favoritePersons.contains(where: { $0.name == name })
//    }
//}

class FavoritesViewModel {

    static let shared = FavoritesViewModel()

    var favoritePersons: [FavoritePerson] = [] {
        didSet {
            saveFavorites()
        }
    }

    private let favoritesKey = "Favorites"

    init() {
        loadFavorites()
    }

    func addFavoritePerson(_ person: FavoritePerson) {
        favoritePersons.append(person)
    }

    func removeFavoritePerson(withName name: String) {
        if let index = favoritePersons.firstIndex(where: { $0.name == name }) {
            favoritePersons.remove(at: index)
        }
    }

    func numberOfFavoritePersons(_ section: Int) -> Int {
            return FavoritesViewModel.shared.favoritePersons.count
        }

    func isPersonFavorite(withName name: String) -> Bool {
           return favoritePersons.contains(where: { $0.name == name })
       }

    private func saveFavorites() {
        let encodedData = try? JSONEncoder().encode(favoritePersons)
        UserDefaults.standard.set(encodedData, forKey: favoritesKey)
    }

    private func loadFavorites() {
        if let savedData = UserDefaults.standard.data(forKey: favoritesKey),
           let loadedFavorites = try? JSONDecoder().decode([FavoritePerson].self, from: savedData) {
            favoritePersons = loadedFavorites
        }
    }
}


