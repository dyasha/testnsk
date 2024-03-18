//
//  CharacterListViewController + TableView.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

extension CharacterListViewController: UITableViewDataSource {

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        registerCell()
    }

    func registerCell() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "customCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = viewModel.characterNames[indexPath.row]
        if let imageUrl = URL(string: viewModel.imageUrls[indexPath.row]) {
            cell.loadImage(from: imageUrl)
        }
        cell.descriptionLabel.text = viewModel.description[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension CharacterListViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
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
