//
//  ContentModel.swift
//  Words
//
//  Created by Kurbatov Artem on 02.03.2022.
//

import Foundation
import SwiftUI


class ContentModel:ObservableObject {
    
    @Published var collections: [Collection]
    
    @Published var currentCardIndex: Int?
    @Published var currentCollectionIndex: Int?
//    @Published var frontDegree = 0.0
//    @Published var backDegree = -90.0
//    @Published var flipped = false
    
    init(){
        
        if let data = UserDefaults.standard.data(forKey: "SavedData") {
            
            if let decoded = try? JSONDecoder().decode([Collection].self, from: data) {
                collections = decoded
                return
            }
        }
        collections = []
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(collections) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
        }
    }
    
//    func flipCard () {
//        let durationAndDelay = 0.3
//        flipped.toggle()
//         if flipped {
//             withAnimation(.linear(duration: durationAndDelay)) {
//                 backDegree = 90
//             }
//             withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
//                 frontDegree = 0
//             }
//         } else {
//             withAnimation(.linear(duration: durationAndDelay)) {
//                 frontDegree = -90
//             }
//             withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
//                 backDegree = 0
//             }
//         }
//     }
//    
    
    // MARK: - Card Section
    
    func addCard(collectionId: UUID, front: String, back: String) {
        
        findCollectionIndex(collectionId: collectionId)
        
        if currentCollectionIndex != nil {
            collections[currentCollectionIndex!].cards.append(Card(id: UUID(), front: front, back: back))
        }
    }
    
    func findCardIndex(collectionId: UUID, cardId: UUID) {
        
        findCollectionIndex(collectionId: collectionId)
        
        if currentCollectionIndex != nil {
            for index in 0..<collections[currentCollectionIndex!].cards.count {
                if collections[currentCollectionIndex!].cards[index].id == cardId {
                    currentCardIndex = index
                }
            }
        }
    }
    
    func removeCard(collectionId: UUID, cardId: UUID) {
        
        findCardIndex(collectionId: collectionId, cardId: cardId)
        findCollectionIndex(collectionId: collectionId)
        
        if currentCardIndex != nil && currentCollectionIndex != nil {
            collections[currentCollectionIndex!].cards.remove(at: currentCardIndex!)
        }
    }
    
    // MARK: - Collection Section
    
    func addCollection(title: String) {
        
        collections.append(Collection(id: UUID(), title: title))
    }
    
    
    func removeCollection(collectionId: UUID) {
        
        findCollectionIndex(collectionId: collectionId)
        
        if currentCollectionIndex != nil {
            collections.remove(at: currentCollectionIndex!)
        }
    }
    
    func findCollectionIndex(collectionId: UUID) {
        
        for index in 0..<collections.count {
            
            if collections[index].id == collectionId {
                currentCollectionIndex = index
            }
        }
    }
    
    func checkCollectionsContent() -> String {
        
        if collections.isEmpty {
            return "You don't have collections"
        }
        else {
            for collection in collections {
                if !collection.cards.isEmpty {
                    return "Ok"
                }
            }
        }
        return "You don't have cards"
    }
}
