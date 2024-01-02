//
//  Message.swift
//  MessengerTutorial
//
//  Created by user on 04/01/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable, Hashable {
    @DocumentID var messageId: String?
    var fromId: String
    var toId: String
    var messageText: String
    var timestamp: Timestamp
    
    var user: User?
    
    var id: String {
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool {
        return fromId == Auth.auth().currentUser?.uid
    }
    
    var timestampString: String {
        return timestamp.dateValue().timestampString()
    }
}
