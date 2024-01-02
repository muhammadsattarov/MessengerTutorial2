//
//  LoginViewModel.swift
//  MessengerTutorial
//
//  Created by user on 03/01/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(withemail: email, password: password)
    }
}
