//
//  Constans.swift
//  MessengerTutorial
//
//  Created by user on 05/01/24.
//

import Foundation
import Firebase

struct FirestoreConstants {
    static let userCollection = Firestore.firestore().collection("users")
    static let messagesCollection = Firestore.firestore().collection("messages")
}
