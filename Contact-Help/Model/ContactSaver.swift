//
//  ContactSaver.swift
//  Contact-Help
//
//  Created by PRABALJIT WALIA     on 30/01/21.
//

import UIKit
class ContactSaver: NSObject {
    
    func saveContact(image: UIImage, firstName: String, email: String, imageData:Data) {
        let contact = Person(name: firstName, email: email, imageData: imageData)
        writeToJSON(contact)
        saveImage(image: image, name: firstName)
    }
    
    func writeToJSON (_ contact: Person) {
        let url = Self.getDocumentsDirectory().appendingPathComponent("contacts.json")
        
        // initialise contacts
        var contacts = [Person]()
        
        do {
            if let decoded = try? Data(contentsOf: url) {
                contacts = try! JSONDecoder().decode([Person].self, from: decoded)
            }
            contacts.append(contact)
            let encoded = try! JSONEncoder().encode(contacts)
            try encoded.write(to: url, options: [.atomic])
            print("Data saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveImage (image: UIImage, name: String) {
        
        let imageUrl = Self.getDocumentsDirectory().appendingPathComponent("\(name).jpeg")
        
        // save image
        do {
            if let jpegData = image.jpegData(compressionQuality: 0.8) {
                try jpegData.write(to: imageUrl, options: [.atomicWrite, .completeFileProtection])
                print("Image saved.")
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    static func decodeContacts() -> [Person] {
        let url = self.getDocumentsDirectory().appendingPathComponent("contacts.json")
        
        // initialise contacts
        var contacts = [Person]()
        
        
        if let decoded = try? Data(contentsOf: url) {
            contacts = try! JSONDecoder().decode([Person].self, from: decoded)
        }
        
        return contacts
    }
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
