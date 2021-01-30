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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
