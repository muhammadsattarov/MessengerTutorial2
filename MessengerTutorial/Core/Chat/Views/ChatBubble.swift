//
//  ChatBubble.swift
//  MessengerTutorial
//
//  Created by user on 03/01/24.
//

import SwiftUI

struct ChatBubble: Shape {
    let isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [
                                    .topRight,
                                    .topLeft,
                                    isFromCurrentUser ? .bottomLeft : .bottomRight
                                ],
                                cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble(isFromCurrentUser: true)
}
