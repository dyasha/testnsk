//
//  CharacterListViewController.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

protocol CharacterDetailsDelegate: AnyObject {

    func showCharacterDetails(personName: String, personImage: UIImage?, personDescription: String)
}

class CharacterListViewController: UIViewController {

    var viewModel = CharacterListViewModel()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отмена", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()

        viewModel.request()
        reloadTableView()
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)

    }

    private func reloadTableView() {
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(cancelButton)
        setupTableView()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cancelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            cancelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func cancelButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CharacterListViewController: CharacterDetailsDelegate {
    func showCharacterDetails(personName: String, personImage: UIImage?, personDescription: String) {
        let characterVC = PersonViewController()
        characterVC.viewModel.personName = personName
        characterVC.viewModel.personImage = personImage
        characterVC.viewModel.personDescription = personDescription

        present(characterVC, animated: true, completion: nil)
    }
}
