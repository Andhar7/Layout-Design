//
//  CardView.swift
//  CardView
//
//  Created by Andrej Kling on 12.08.21.
//

import SwiftUI

struct CardView: View {
    
    let card : Reality
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            
            Image(card.imageName)
                .resizable()
                .frame(width: width - 66, height: height / 1.2)
            
            HStack {
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text(card.city)
                    
                    Text(card.arrayPodrobnosti[0])
                        
                }
                .padding()
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .bold, design: .serif).italic())
     
                Spacer().frame(width: 118)
            }
            .background(Color.black.opacity(0.3))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: houses[0])
    }
}
