//
//  DetailView.swift
//  DetailView
//
//  Created by Andrej Kling on 12.08.21.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var selectHouse : Reality
    @Binding var showDetail : Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Color.blue.ignoresSafeArea()
            
            ForEach(houses) { item in
                Text(item.arrayPodrobnosti[1])
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .regular, design: .serif))
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(.top, 55)
                .padding()
            }
         
            Button(action: {
                showDetail.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.white)
            })
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(selectHouse: .constant(houses[0]), showDetail: .constant(false))
    }
}
