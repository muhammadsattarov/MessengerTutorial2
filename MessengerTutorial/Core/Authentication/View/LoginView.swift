//
//  LoginView.swift
//  MessengerTutorial
//
//  Created by user on 02/01/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
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
                    
                    SecureField("Enter your Password", text: $viewModel.password)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 22)
                }
                
                    Button(action: {
                        print("Forgot Password")
                    }, label: {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 28)
                    })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                      
                    
                    // Login button
                    Button(action: {
                        Task { try await viewModel.login() }
                    }, label: {
                        Text("Login")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    })
                    .padding(.vertical)
                    
                    // facebook login
                    HStack{
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                        Text("OR")
                            .font(.footnote)
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    }
                    .foregroundStyle(.gray)
                    
                    HStack{
                        Image("facebook")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Continue with Facebook")
                    }
                    .foregroundColor(.blue)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
                
                // Sign Up link
                Divider()
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack{
                        Text("Don't have an account?")
                         
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
                
                
            }
        }
    }
}

#Preview {
    LoginView()
}
