//
//  DetailView.swift
//  Contact-Help
//
//  Created by PRABALJIT WALIA     on 30/01/21.
//

import SwiftUI

struct AddPerson: View {
    @State private var showingImagePicker = false
    @State private var image:Image?
    @State private var inputImage: UIImage?
    @State private var name:String
    @State private var email:String
    @Binding var persons: [Person]
    var body: some View {
        GeometryReader{geometry in
            NavigationView{
                Form{
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }
                Section{
                    Button(action:{self.showingImagePicker = true}){
                        HStack{
                        Image(systemName: "camera")
                        Text("Add a photo")
                    }}
                    .sheet(isPresented:$showingImagePicker){
                        ImagePicker(image: self.$inputImage)
                    }
                    if self.inputImage != nil{
                        Image(uiImage: self.inputImage!)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
            }
            .navigationBarTitle("Add New Contact")
        }
    }
    func getDocumentsDirectory()->URL{
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
    }
    func saveData() {
          do {
              let filename = getDocumentsDirectory().appendingPathComponent("persons")
              let data = try JSONEncoder().encode(self.persons)
              try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
          } catch {
              print("unable to save data")
          }
      }
}

struct AddPerson_Previews: PreviewProvider {
    static var previews: some View {
        AddPerson( name: <#String#>, email: <#String#>)
    }
}
