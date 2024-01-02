//
//  ChatMessageCell.swift
//  MessengerTutorial
//
//  Created by user on 03/01/24.
//

import SwiftUI

struct ChatMessageCell: View {
    let message: Message
    
    private var isFromCurrentUser: Bool {
        return message.isFromCurrentUser
    }
    
    var body: some View {
        HStack{
            if isFromCurrentUser {
                Spacer()
                
                Text(message.messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            } else {
                HStack(alignment: .bottom, spacing: 8){
                    CircularProfileImageView(user: User.USER_MOCK, size: .xxSmall)
                    
                    Text(message.messageText)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGroupedBackground))
                        .foregroundStyle(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

//#Preview {
//    ChatMessageCell(message: Message)
//}
