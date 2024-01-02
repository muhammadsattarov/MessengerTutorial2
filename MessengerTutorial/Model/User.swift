//
//  User.swift
//  MessengerTutorial
//
//  Created by user on 03/01/24.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    let fullname: String
    let email: String
    var profileImageUrl: String?
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
    
    var firstname: String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullname)
        return components?.givenName ?? fullname
    }
}

extension User {
    static let USER_MOCK = User(fullname: "Black Pantera", email: "Pantera@gmail.com", profileImageUrl: "black-panther")
}
