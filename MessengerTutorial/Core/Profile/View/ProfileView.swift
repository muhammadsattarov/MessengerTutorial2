//
//  ProfileView.swift
//  MessengerTutorial
//
//  Created by user on 02/01/24.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    let user: User
    var body: some View {
        VStack{
            // header
            VStack{
                PhotosPicker(selection: $viewModel.selectedItem) {
                    if let profileImage = viewModel.profileImage{
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: user, size: .xLarge)                    }
                }
                
                
                
                Text(user.fullname)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            // List
            List {
                Section{
                    ForEach(SettingsOptionsViewModel.allCases) {option in
                        HStack{
                            Image(systemName: option.image)
                                .resizable()
                                .frame(width: 24,height: 24)
                                .foregroundStyle(option.imageBacgroundColor)
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section{
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Text("Sign Out")
                    }
                    
                    Button("Delete Account") {
                        
                    }
                }
                .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    ProfileView( user: User.USER_MOCK)
}
