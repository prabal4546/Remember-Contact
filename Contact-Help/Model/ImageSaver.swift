//
//  ImageSaver.swift
//  Contact-Help
//
//  Created by PRABALJIT WALIA     on 31/01/21.
//

import UIKit

class ImageSaver: NSObject {
    
    func writetoJSON(image: UIImage, firstName: String, email: String) {
        
        let contact = Person(name: firstName, email: email, id: UUID())

        let imageUrl = self.getDocumentsDirectory().appendingPathComponent("\(contact.id).jpeg")
        let contactsUrl = self.getDocumentsDirectory().appendingPathComponent("contacts.json")
        
        // initialise contacts
        var contacts = [Person]()
        
        if let decoded = try? Data(contentsOf: contactsUrl) {
            contacts = try! JSONDecoder().decode([Person].self, from: decoded)
        }
        
        // save contacts
        do {
            contacts.append(contact)
            let encoded = try! JSONEncoder().encode(contacts)
            try encoded.write(to: contactsUrl, options: [.atomic])
            print("Data saved")
            
        } catch {
            print(error.localizedDescription)
        }
        
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
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
