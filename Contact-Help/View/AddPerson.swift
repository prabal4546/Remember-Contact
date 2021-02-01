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
    @State private var name = ""
    @State private var email = ""
    @Environment(\.presentationMode) var presentationMode
//    @Binding var persons : [Person]
    @State private var persons: [Person] = ContactSaver.decodeContacts()
    var body: some View {
        NavigationView{
        GeometryReader{geometry in
            
                Form{
                    Section(){
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                    }
                }
         
                Section(){
                    HStack{
                        Button(action:{self.showingImagePicker = true}){
                        Image(systemName: "camera")
                        Text("Add a photo")
                    }}
                    .sheet(isPresented:$showingImagePicker){
                        ImagePicker(image: self.$inputImage )
                    }
                    if self.inputImage != nil{
                        Image(uiImage: self.inputImage!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.3)
                            .clipShape(Circle())
                            
                        
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                
            }
            .navigationBarTitle("Add New Contact")
            .navigationBarItems(trailing: Button("Save"){
               let contactSaver = ContactSaver()
               contactSaver.saveContact(image: inputImage!, firstName: name, email: email)
               persons = ContactSaver.decodeContacts()
                self.presentationMode.wrappedValue.dismiss()
//                self.saveData()
            })
       
            
            
        }
        .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: self.$inputImage)
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
//    func saveData() {
//          do {
//              let filename = getDocumentsDirectory().appendingPathComponent("persons")
//              let data = try JSONEncoder().encode(self.persons)
//              try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
//          } catch {
//              print("unable to save data")
//          }
//      }
}

struct AddPerson_Previews: PreviewProvider {

//     static var personas = Person(name: "", email: "", imageData: (UIImage(systemName: "plus")?.jpegData(compressionQuality: 0.1))!)

    static var previews: some View {
        AddPerson()
    }
}
