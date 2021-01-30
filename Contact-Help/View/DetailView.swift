//
//  DetailView.swift
//  Contact-Help
//
//  Created by PRABALJIT WALIA     on 30/01/21.
//

import SwiftUI

struct DetailView: View {
    @State private var showingImagePicker = false
    @State private var image:Image?
    @State private var inputImage: UIImage?
    @State private var name:String
    @State private var email:String
    var body: some View {
        GeometryReader{geometry in
            NavigationView{
                Form{
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                }
                Section{
                    HStack{
                        Image(systemName: "camera")
                        Text("Add a photo")
                    }
                    .sheet(isPresented:$showingImagePicker){
                        ImagePicker(image: self.$inputImage)
                    }
                }
            }
            .navigationBarTitle("Add New Contact")
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView( name: <#String#>, email: <#String#>)
    }
}
