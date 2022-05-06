//
//  NewCollectionForm.swift
//  Words
//
//  Created by Kurbatov Artem on 23.03.2022.
//

import SwiftUI

struct NewCollectionForm: View {
    
    @EnvironmentObject var model: ContentModel
    @State var title = ""
    @Binding var showForm: Bool
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Enter collection title")
                .bold()
            
            TextField("", text: $title, prompt: Text("title"))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
            
            
            HStack(spacing: 30) {
                Button {
                    showForm = false
                } label: {
                    Text("Cancel")
                }
                
                Button {
                    
                    if title != "" {
                        
                        model.addCollection(title: title)
                        showForm = false
                        model.save()
                    }
                    else {
                        print("Invalid title")
                    }
                    
                } label: {
                    Text("Create")
                }
            }
        }
    }
}
