//
//  AuthViewModel.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import Foundation

class AuthViewModel {

    private var model: AuthModel

    init(model: AuthModel) {
        self.model = model
    }

    func validateLoginAndPassword(login: String, password: String) -> Bool {
        let isLoginValid = model.validateLogin(login)
        let isPasswordValid = model.validatePassword(password)
        return isLoginValid && isPasswordValid
    }

    func authUser(login: String, password: String, completion: @escaping (Bool) -> Void) {
        completion(true)
    }
}
