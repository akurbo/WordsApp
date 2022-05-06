//
//  EditCardForm.swift
//  Words
//
//  Created by Kurbatov Artem on 29.03.2022.
//

import SwiftUI

struct EditCardForm: View {
    
    @EnvironmentObject var model: ContentModel
    
    @Binding var front: String
    @Binding var back: String
    @Binding var showForm: Bool
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Text("Edit the card")
                .bold()
                .padding(.bottom, 20)
            
            TextField("", text: $front, prompt: Text("front"))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 40)
                .padding(.bottom, 10)
            
            TextField("", text: $back, prompt: Text("back"))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 40)
                .padding(.bottom, 20)
            
            Button {
                
                if front != "" && back != "" {
                    
                    if model.currentCardIndex != nil && model.currentCollectionIndex != nil {
                        
                        var currentCard = model.collections[model.currentCollectionIndex!].cards[model.currentCollectionIndex!]
                        currentCard.front = self.front
                        currentCard.back = self.back
                        
                        showForm = false
                        model.save()
                    }
                }
                else {
                    // Handle error
                    print("Invalid title")
                }
                
            } label: {
                Text("Edit")
            }
        }
    }
}
