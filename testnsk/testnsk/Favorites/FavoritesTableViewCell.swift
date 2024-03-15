//
//  FavoritesTableViewCell.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!

    var onDeleteButtonTapped: (() -> Void)?

    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        onDeleteButtonTapped?()
    }
}
