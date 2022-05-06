//
//  ContentView.swift
//  Words
//
//  Created by Kurbatov Artem on 02.03.2022.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        TabView {
            
            CollectionsEditor()
                .tabItem {
                    VStack {
                        Image(systemName: "square.grid.2x2.fill")
                        Text("Collections")
                    }
                }
            
            CollectionsList()
                .tabItem {
                    VStack {
                        Image(systemName: "graduationcap.fill")
                        Text("Learn")
                    }
                }
            
            Premium()
                .tabItem {
                    VStack {
                        Image(systemName: "crown.fill")
                        Text("Premium")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
