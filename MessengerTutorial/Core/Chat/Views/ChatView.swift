//
//  ChatView.swift
//  MessengerTutorial
//
//  Created by user on 03/01/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User) {
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack{
            ScrollView{
                // Header
                VStack{
                    CircularProfileImageView(user: user, size: .large)
                    
                    VStack(spacing: 4){
                        Text(user.fullname)
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                }
                // message
                
                LazyVStack{
                    ForEach(viewModel.messages) { message in
                        ChatMessageCell(message: message)
                    }

                }
                
            }
            // message input view
            ZStack(alignment: .trailing){
                TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 55)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                Button{
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                }label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(user.fullname)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.USER_MOCK)
}
