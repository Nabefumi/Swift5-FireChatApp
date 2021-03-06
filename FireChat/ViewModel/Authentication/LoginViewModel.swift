//
//  LoginViewModel.swift
//  FireChat
//
//  Created by Takafumi Watanabe on 2022-03-16.
//

import Foundation

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false
        && password?.isEmpty == false
    }
}
