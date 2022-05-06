//
//  NewCardForm.swift
//  Words
//
//  Created by Kurbatov Artem on 23.03.2022.
//

import SwiftUI

struct NewCardForm: View {
    
    @EnvironmentObject var model: ContentModel
    @State var front = ""
    @State var back = ""
    var collection: Collection
    @Binding var showForm: Bool
    
    var body: some View {
        
        
            VStack(spacing: 0) {
                
                Text("Create a card")
                    .bold()
                    .padding(.bottom, 20)
                
                TextField("", text: $front, prompt: Text("front"))
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                
                TextField("", text: $back, prompt: Text("back"))
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                
                HStack(spacing: 30) {
                    
                    Button {
                        
                        showForm = false
                        }
                        
                     label: {
                        Text("Cancel")
                    }
                    
                    Button {
                        
                        if front != "" && back != "" {
                            
                            model.addCard(collectionId: collection.id, front: front, back: back)
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
