//
//  PersonViewController.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

class PersonViewController: UIViewController {

    var viewModel: PersonViewModel = PersonViewModel()

    let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        return imageView
    }()

    let personNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()

    let personDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 19)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .lightGray
        button.setTitle("Избранное", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(personImageView)
        view.addSubview(personNameLabel)
        view.addSubview(personDescription)
        view.addSubview(favoriteButton)

        setupFavoriteButton()
        updateUIWithViewModel()
        setConstraints()
    }

    private func setupFavoriteButton() {
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    @objc private func favoriteButtonTapped() {
        if FavoritesViewModel.shared.isPersonFavorite(withName: viewModel.personName) {
            FavoritesViewModel.shared.removeFavoritePerson(withName: viewModel.personName)
            UserDefaults.standard.set(false, forKey: "isFavorite_\(viewModel.personName)")
        } else {
            let person = FavoritePerson(name: viewModel.personName, imageUrl: viewModel.personImage?.pngData())
            FavoritesViewModel.shared.addFavoritePerson(person)
            UserDefaults.standard.set(true, forKey: "isFavorite_\(viewModel.personName)")
        }
        viewModel.toggleFavorite()
        updateUIWithViewModel()
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            personImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            personImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personImageView.widthAnchor.constraint(equalToConstant: 350),
            personImageView.heightAnchor.constraint(equalToConstant: 350),

            personNameLabel.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 40),
            personNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            personNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            personDescription.topAnchor.constraint(equalTo: personNameLabel.bottomAnchor, constant: 10),
            personDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            personDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

        ])
    }

    private func updateUIWithViewModel() {
        personNameLabel.text = viewModel.personName
        personImageView.image = viewModel.personImage
        personDescription.text = viewModel.personDescription

        if FavoritesViewModel.shared.isPersonFavorite(withName: viewModel.personName) {
            favoriteButton.setTitle("Удалить из избранного", for: .normal)
        } else {
            favoriteButton.setTitle("Добавить в избранное", for: .normal)
        }
    }
}
