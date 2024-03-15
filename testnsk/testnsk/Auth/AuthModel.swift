//
//  AuthModel.swift
//  testnsk
//
//  Created by Владислав Береснев on 14.03.2024.
//

import Foundation

struct AuthModel {
    func validateLogin(_ login: String) -> Bool {
        true
//        login.contains { $0.isUppercase }
    }

    func validatePassword(_ password: String) -> Bool {
        true
//        password.count >= 2
    }
}
