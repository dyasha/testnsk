//
//  AuthViewController.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

class AuthViewController: UIViewController {

    private var viewModel: AuthViewModel!
    private var authView: AuthView!

    override func loadView() {
        super.loadView()
        let model = AuthModel()
        viewModel = AuthViewModel(model: model)
        authView = AuthView()
        self.view = authView
        setupActions()

        authView.usernameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        authView.passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }

    private func setupActions() {
        authView.authButton.addTarget(self, action: #selector(authButtonTapped), for: .touchUpInside)
    }

    @objc private func authButtonTapped() {
        guard let login = authView.usernameTextField.text,
              let password = authView.passwordTextField.text,
              viewModel.validateLoginAndPassword(login: login, password: password) else {
            return
        }

        viewModel.authUser(login: login, password: password) { [weak self] success in
            if success {
                print("Вход выполнен успешно")
                let mainTabBarController = MainTabBarController()
                mainTabBarController.modalPresentationStyle = .fullScreen
                DispatchQueue.main.async {
                    self?.present(mainTabBarController, animated: true, completion: nil)
                }
            } else {
                print("Ошибка")
            }
        }
    }

    @objc private func textFieldChanged() {
        authView.update(with: viewModel)
    }
}
