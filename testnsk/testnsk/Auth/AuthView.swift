//
//  AuthView.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import UIKit

class AuthView: UIView {

    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Логин"
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Пароль"
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let authButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        authButton.isEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .lightGray

        addSubview(usernameTextField)
        addSubview(passwordTextField)
        addSubview(authButton)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapGesture)
    }


    private func setConstraints() {
        NSLayoutConstraint.activate([
            authButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            authButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            authButton.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.bottomAnchor.constraint(equalTo: authButton.topAnchor, constant: -20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            usernameTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }


    @objc private func dismissKeyboard() {
        endEditing(true)
    }

    func update(with viewModel: AuthViewModel) {
        let isUsernameFilled = !(usernameTextField.text?.isEmpty ?? true)
        let isPasswordFilled = !(passwordTextField.text?.isEmpty ?? true)

        if isUsernameFilled && isPasswordFilled {
            authButton.backgroundColor = .systemGreen
            authButton.isEnabled = true
        } else {
            authButton.backgroundColor = .systemRed
            authButton.isEnabled = false
        }
    }
}
