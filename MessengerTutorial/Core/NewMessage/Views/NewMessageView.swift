//
//  NewMessageView.swift
//  MessengerTutorial
//
//  Created by user on 02/01/24.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @StateObject var viewModel = NewMessageViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var selectedUser: User?
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    TextField("To...", text: $searchText)
                        .frame(height: 45)
                        .padding(.leading)
                        .background(Color(.systemGroupedBackground))
                    
                    Text("CONTACTS")
                        .font(.footnote)
                        .opacity(0.3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    ForEach(viewModel.users) { user in
                        VStack {
                            HStack(spacing: 10){
                                CircularProfileImageView(user: user, size: .small)
                                Text(user.fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                            }
                            .padding(.leading)
                            Divider()
                                .padding(.leading, 40)
                        }
                        .onTapGesture {
                            selectedUser = user
                            dismiss()
                        }
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button ("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    NewMessageView(selectedUser: .constant(User.USER_MOCK))
}
