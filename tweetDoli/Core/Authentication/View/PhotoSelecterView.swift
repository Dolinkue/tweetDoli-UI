//
//  PhotoSelecterView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 05/05/2022.
//

import SwiftUI

struct PhotoSelecterView: View {
    @State  var showImagePicker: Bool = false
    // viene de UIKit
    @State  private var selectedImage: UIImage?
    // viene de swiftUI
    @State  private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel


    var body: some View {

        VStack {
            VStack(alignment: .leading){
                HStack {Spacer()}

                Text("Setup Account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)

                Text("Add a profile Photo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)


            }

            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
        .clipShape(RoundedShape(corders: [.bottomRight]))


            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .frame(width: 180, height: 180)
                        .padding()
                } else {
                        Image(systemName: "plus")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 180, height: 180)
                            .padding()
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                    }
                }

            
            
            .clipShape(Circle())
            .padding()

            
//            NavigationLink(destination: ImagePicker(selectedImage: $selectedImage),
//                           isActive: $showImagePicker,
//                           label: {})
            
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            



            Spacer()
        }
        .ignoresSafeArea()


    }
    // con esta funcion cambiamos la imagen
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        
        profileImage = Image(uiImage: selectedImage)

        
    }

}

struct PhotoSelecterView_Previews: PreviewProvider {
    
    static var previews: some View {
        PhotoSelecterView()
    }
}
