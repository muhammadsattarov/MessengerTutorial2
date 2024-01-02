//
//  RegistratsionViewModel.swift
//  MessengerTutorial
//
//  Created by user on 03/01/24.
//

import SwiftUI

class RegistratsionViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(withemail: email, password: password, fullname: fullname)
    }
}


