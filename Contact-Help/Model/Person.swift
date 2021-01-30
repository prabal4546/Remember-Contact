//
//  Person.swift
//  Contact-Help
//
//  Created by PRABALJIT WALIA     on 30/01/21.
//

import Foundation
import SwiftUI

struct Person:Codable,Comparable {
    var name:String
    var email:String
    var imageData:Data
    static func < (lhs:Person, rhs:Person)->Bool{
           lhs.name < rhs.name
       }
    
    func loadImageData(data: Data) -> UIImage {
        return UIImage(data: data)!
    }
}
