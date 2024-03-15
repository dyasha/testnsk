//
//  PersonViewModel.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

class PersonViewModel {
    var personName: String = ""
    var personImage: UIImage?
    var isFavorite: Bool = false

    init(personName: String = "", personImage: UIImage? = nil) {
        self.personName = personName
        self.personImage = personImage
    }

    func toggleFavorite() {
        isFavorite.toggle()
    }
}
