//
//  Route.swift
//  MessengerTutorial
//
//  Created by user on 08/01/24.
//

import Foundation


enum Route: Hashable {
    case profile(User)
    case chatView(User)
}
