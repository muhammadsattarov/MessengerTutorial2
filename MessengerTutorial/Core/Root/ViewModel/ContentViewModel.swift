//
//  ContentViewModel.swift
//  MessengerTutorial
//
//  Created by user on 03/01/24.
//

import Firebase
import Combine


class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    private var canselables = Set<AnyCancellable>()
    
    init() {
        setupSubscribes()
    }
    
    private func setupSubscribes() {
        AuthService.shared.$userSession.sink { [ weak self ] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &canselables)
    }
}
