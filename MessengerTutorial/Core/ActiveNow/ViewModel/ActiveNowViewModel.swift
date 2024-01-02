//
//  ActiveNowViewModel.swift
//  MessengerTutorial
//
//  Created by user on 08/01/24.
//

import Foundation
import Firebase

@MainActor
class ActiveNowViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
   
    private func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers(limit: 10)
        self.users = users.filter({ $0.id != currentUid })
    }
}
