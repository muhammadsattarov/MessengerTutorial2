//
//  RegistrationView.swift
//  MessengerTutorial
//
//  Created by user on 02/01/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistratsionViewModel()
    @Environment(\.presentationMode) var mode
    var body: some View {
        VStack{
            Spacer()
            
            Image("messenger")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack(spacing: 12){
                TextField("Enter your Email", text: $viewModel.email)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 22)
                
                TextField("Enter your full name", text: $viewModel.fullname)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 22)
                
                SecureField("Enter your Password", text: $viewModel.password)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 22)
            }
            
            Button(action: {
                Task { try await viewModel.createUser() }
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            })
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            Button {
                mode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an accounr?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
