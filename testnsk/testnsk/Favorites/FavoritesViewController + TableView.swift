//
//  FavoritesViewController + TableView.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

extension FavoritesViewController: UITableViewDataSource {
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
    }

    private func registerCell() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "customCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfFavoritePersons(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        let favoritePerson = FavoritesViewModel.shared.favoritePersons[indexPath.row]
        cell.titleLabel.text = favoritePerson.name
        if let image = UIImage(data: favoritePerson.imageUrl ?? Data()) {
            cell.customImageView.image = image
        }
        return cell
    }
}

extension FavoritesViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell {
            cell.showPersonDetails()
        }
    }
}
