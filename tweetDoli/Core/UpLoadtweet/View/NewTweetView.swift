//
//  NewTweetView.swift
//  tweetDoli
//
//  Created by Nicolas Dolinkue on 02/05/2022.
//

import SwiftUI
import Kingfisher
import TTProgressHUD

struct NewTweetView: View {
    
    @State var hudVisible = true
    @State var hudConfig = TTProgressHUDConfig()
    
    @State  var showImagePicker: Bool = false
    // viene de UIKit
    @State  private var selectedImage: UIImage?
    // viene de swiftUI
    @State  private var profileImage: Image?
    
    @State  private var imageTweet2 = ""
    
    @State private var caption = ""
   // @State private var tweetImage = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                
                // ver bug
                
                Button {
                    
                    
                    viewModel.uploadTweet(withCaption: caption, tweetImage: imageTweet2 ?? "")
                   
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                

            }
            .padding()
            
            HStack(alignment: .top){
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)

                }
                
                TextArea("que pasa amigo", text: $caption)
                


            }
            
            Button {
                
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .frame(width: 180, height: 180)
                        .padding()
                }
            }
            
            
            
            Button  {
                showImagePicker.toggle()
            } label: {
                Image(systemName: "camera")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 100, height: 80)
                    .padding()
                    
                    
            }
            .padding()
            
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
                
            }
            
            
        }
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }

    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        
        profileImage = Image(uiImage: selectedImage)
        UpPhotoTweetFirebase.uploadImage(image: selectedImage) { url in
            imageTweet2 = url
            TTProgressHUD($hudVisible, config: hudConfig)
            print(imageTweet2)
            
            
        }
        
       
        
        
        
        
    
    }
}

//struct NewTweetView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewTweetView()
//    }
//}
