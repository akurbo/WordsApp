//
//  CollectionContent.swift
//  Words
//
//  Created by Kurbatov Artem on 03.03.2022.
//

import SwiftUI

struct CollectionContent: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var showingAlert = false
    @State var showCreatForm = false
    @State var showEditForm = false
    
    var collection: Collection
    var body: some View {
        
        ZStack {
            
            if collection.cards.count == 0 {
                
                Text("You have no cards")
                    .foregroundColor(.gray)
                    .padding()
                
            }else {
                
                List(collection.cards) { card in
                    
                        Text(card.front)
                            .foregroundColor(.black)
                            .bold()
                    
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            model.removeCard(collectionId: collection.id, cardId: card.id)
                            model.save()
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                        
                        Button {
                            showEditForm = true
                            model.findCardIndex(collectionId: collection.id, cardId: card.id)
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                    }
                }
            }
        }            .navigationTitle(collection.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        showCreatForm = true
                    }, label: {
                        Image(systemName: "plus.app")
                    })
                    
                    Button(action: {
                        showingAlert.toggle()
                    }, label: {
                        Image(systemName: "trash.fill")
                    })
                        .alert("Remove \(collection.title)?", isPresented: $showingAlert) {
                            
                            HStack {
                                
                                Button {
                                } label: {
                                    Text("No")
                                }
                                
                                Button{
                                    model.removeCollection(collectionId: collection.id)
                                    model.save()
                                } label: {
                                    Text("Yes")
                                }
                            }
                        }
                }
            }
            .sheet(isPresented: $showCreatForm) {

            } content: {
                NewCardForm(collection: collection, showForm: $showCreatForm)
            }
            .sheet(isPresented: $showEditForm, onDismiss: nil) {
                if model.currentCardIndex != nil && model.currentCollectionIndex != nil {
                    
                    EditCardForm(front: $model.collections[model.currentCollectionIndex!].cards[model.currentCardIndex!].front, back: $model.collections[model.currentCollectionIndex!].cards[model.currentCardIndex!].back, showForm: $showEditForm)
                }
            }
    }
}
