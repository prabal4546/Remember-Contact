//
//  Person.swift
//  Contact-Help
//
//  Created by PRABALJIT WALIA     on 30/01/21.
//

import Foundation
import SwiftUI

struct Person:Codable,Comparable,Identifiable {
    var name:String
    var email:String
    var id:UUID
    static func < (lhs:Person, rhs:Person)->Bool{
           lhs.name < rhs.name
       }
    
    func loadImageData(data: Data) -> UIImage {
        return UIImage(data: data)!
    }
}
