//
//  CardView.swift
//  Words
//
//  Created by Kurbatov Artem on 02.03.2022.
//

import SwiftUI

struct CardView: View {
    
    var text: String
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(red: 51/255, green: 153/255, blue: 1, opacity: 0.2))
                .aspectRatio(contentMode: .fit)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
            
            Text(text)
                .padding(.horizontal, 5)
            
        }.padding(.horizontal)
            .foregroundColor(.black)
    }
}
