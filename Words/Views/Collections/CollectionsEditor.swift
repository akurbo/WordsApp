//
//  Collections.swift
//  Words
//
//  Created by Kurbatov Artem on 02.03.2022.
//

import SwiftUI

struct CollectionsEditor: View {
    
    @EnvironmentObject var model: ContentModel
    @State var showForm = false
    
    var body: some View {

            NavigationView{
                
                ZStack {
                    
                    if model.collections.count == 0 {
                        
                        Text("You don't have collections yet")
                            .foregroundColor(.gray)
                            .padding()
                        
                    }else {
                        
                        ScrollView(showsIndicators: false) {
                            
                            let gridItem = GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 20)
                            
                            LazyVGrid(columns: [gridItem], spacing: 20) {
                                ForEach(model.collections) { collection in
                                    NavigationLink {
                                        CollectionContent(collection: collection)
                                    } label: {
                                        ZStack {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundColor(.white)
                                                .shadow(radius: 1)
                                                .frame(height: 150)
                                            
                                            Text(collection.title)
                                                .bold()
                                        }
                                    }
                                }
                            }.padding()
                        }.tint(.black)
                    }
//                    Rectangle()
//                        .foregroundColor(.black)
//                        .opacity(showForm ? 0.3 : 0)
//
//                    if showForm {
//                        NewCollectionForm(showForm: $showForm)
//                    }
                }
                    .navigationTitle("Collections")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        showForm = true
                    }, label: {
                        Image(systemName: "plus.app")
                    }))
            }
            .navigationViewStyle(.stack)
            .sheet(isPresented: $showForm) {
            } content: {
                NewCollectionForm(showForm: $showForm)
            }
    }
}
