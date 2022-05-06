//
//  CollectionsList.swift
//  Words
//
//  Created by Kurbatov Artem on 23.03.2022.
//

import SwiftUI

struct CollectionsList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            
            Group {
                if model.checkCollectionsContent() == "Ok" {
                    
                    List(model.collections) { collection in
                        
                        if collection.cards.count > 0 {
                            NavigationLink {
                                ExerciseScreen(collection: collection)
                            } label: {
                                Text(collection.title)
                                    .bold()
                            }
                        }
                    }
                }
                else {
                    Text(model.checkCollectionsContent())
                        .foregroundColor(.gray)
                        .padding()
                }
            }.navigationTitle("Learn")
                .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        
    }
}
