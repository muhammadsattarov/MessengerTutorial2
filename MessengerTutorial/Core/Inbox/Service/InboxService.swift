//
//  InboxService.swift
//  MessengerTutorial
//
//  Created by user on 05/01/24.
//

import Foundation
import Firebase

class InboxService {
    @Published var documentChanges = [DocumentChange]()
    
    func observeResentMessages(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let query = FirestoreConstants
            .messagesCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp", descending: true)
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
            }) else { return }
            
            self.documentChanges = changes
        }
    }
}
