//
//  ExerciseScreen.swift
//  Words
//
//  Created by Kurbatov Artem on 23.03.2022.
//

import SwiftUI

struct ExerciseScreen: View {
    
    @EnvironmentObject var model: ContentModel
    @State var cardIndex = 0
    @State var flipped = false
    
    @State var collection: Collection
    
    var body: some View {
        
        VStack {
            
            CardView(text: flipped == false ? collection.cards[cardIndex].front : collection.cards[cardIndex].back)
            .onTapGesture {
                //model.flipCard()
                flipped.toggle()
            }

            HStack {
                
                Button {
                    if cardIndex - 1 > -1 {
                        cardIndex -= 1
                    }
                } label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        .foregroundColor(cardIndex > 0 ? .blue : .gray)
                }
                
                Spacer()
                
                Button {
                    collection.cards.shuffle()
                } label: {
                    Image(systemName: "shuffle.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                }
                
                Spacer()
                
                Button {
                    if cardIndex + 1 < collection.cards.count{
                        cardIndex += 1
                    }
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .scaledToFit()
                        .foregroundColor(cardIndex < collection.cards.count - 1 ? .blue : .gray)
                }
            }
            .padding(.horizontal)
            .padding(.top)
        }.navigationTitle(collection.title)
        
    }
}
