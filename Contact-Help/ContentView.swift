//
//  ContentView.swift
//  Contact-Help
//
//  Created by PRABALJIT WALIA     on 30/01/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingImagePicker = false
    @State private var image:Image?
    @State private var inputImage: UIImage?
    var body: some View {
        NavigationView{
            VStack{
                image?
                    .resizable()
                    .scaledToFit()
                        
                Button("Import Picture"){
                    self.showingImagePicker = true
                }
            }
            .sheet(isPresented:$showingImagePicker,onDismiss: loadImage){
                ImagePicker( image: self.$inputImage)
            }
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
