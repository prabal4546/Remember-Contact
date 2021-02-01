//
//  ContentView.swift
//  Contact-Help
//
//  Created by PRABALJIT WALIA     on 30/01/21.
//

import SwiftUI

struct ContentView: View {

    @State private var showingAddPersonScreen = false
    @State private var image:Image?
    @State private var inputImage: UIImage?
//    @State private var imageDescription:String
    @State private var persons: [Person] = ContactSaver.decodeContacts()

    var body: some View {
        NavigationView{
            VStack{
//                image?
//                    .resizable()
//                    .scaledToFit()
//                    .overlay(ImageOverlay(),alignment: .bottomLeading)
                    
//                Button("Import Picture"){
//                    self.showingImagePicker = true
//                }
            }.navigationBarItems(trailing: Button(action:{
//                self.showingImagePicker = true
                self.showingAddPersonScreen = true
                
            })
            {
                Image(systemName: "person.crop.circle.badge.plus")
                    
            }.sheet(isPresented:$showingAddPersonScreen){
                AddPerson()
            }
         )
//            .sheet(isPresented:$showingImagePicker,onDismiss: loadImage){
//                ImagePicker( image: self.$inputImage)
//            }
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
//        TextField("Image Description", text: self.$imageDescription)
    }
}
//struct ImageOverlay: View {
//    var body: some View {
//        ZStack {
//            Text("Credit: Ricardo Gomez Angel")
//                .font(.callout)
//                .padding(6)
//                .foregroundColor(.white)
//        }.background(Color.black)
//        .opacity(0.8)
//        .cornerRadius(10.0)
//        .padding(6)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
