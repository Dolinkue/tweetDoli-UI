//
//  RegistrationView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 03/05/2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userName = ""
    @State private var fullName = ""
    @Environment (\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        
        
        
        VStack{
            // con esto activamos para sacar la foto de usuario, y cuando completemos nos lleva a sacar la foto
            
            
            NavigationLink(destination: PhotoSelecterView(),
                           isActive: $viewModel.didAuthUser,
                           label: {})
            
            
            VStack(alignment: .leading){
                HStack {Spacer()}
                
                Text("Get started.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corders: [.bottomRight]))
            
            VStack(spacing: 40) {
                
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(imageName: "person", placeholderText: "Username", text: $userName)
                
                CustomInputField(imageName: "person", placeholderText: "Full name", text: $fullName)
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
                
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            

            
            Button {
            viewModel.register(withEmail: email, password: password, fullName: fullName, usernName: userName)
            } label: {
                Text("Sing up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            

            Spacer()
            
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("Already have an account? Sing in")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.bottom, 32)
                }
            }

           }

        
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
