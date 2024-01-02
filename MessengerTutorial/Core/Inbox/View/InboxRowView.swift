//
//  InboxRowView.swift
//  MessengerTutorial
//
//  Created by user on 02/01/24.
//

import SwiftUI

struct InboxRowView: View {
    let message: Message
    var body: some View {
        HStack(alignment:.top, spacing: 12) {
            CircularProfileImageView(user: message.user, size: .large)
            VStack(alignment: .leading){
                Text(message.user?.fullname ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(message.messageText)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .lineLimit(2)
            }
            
            Spacer()
            
            HStack{
                Text(message.timestampString)

                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundStyle(.gray)
            
        }
        .frame(height: 72)
    }
}

//#Preview {
//    InboxRowView()
//}
