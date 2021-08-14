//
//  HomeView.swift
//  HomeView
//
//  Created by Andrej Kling on 12.08.21.
//

import SwiftUI
import CollectionViewPagingLayout

struct HomeView: View {
    
    @State private var selectHouse : Reality = houses[0]
    @State private var showDetail = false
    
    // Use the options to customize the layout
    var options: ScaleTransformViewOptions {
        .layout(.invertedCylinder)
    }
    
    var body: some View {
        
        ZStack {
            
            ScalePageView(houses)  { house in
                
//                CardView(card: house)
                
                ZStack(alignment: .bottomLeading) {
                    
                    Image(house.imageName)
                        .resizable()
                        .onTapGesture {
                            selectHouse = house
                            showDetail.toggle()
                    }
                    
                    VStack {
                        
                        Text(house.arrayShortPodrobnosti[0])
                          
                        Text(house.arrayPodrobnosti[0])
                           
                    }
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .frame(maxWidth: .infinity)
                    .background(Color("Color1").opacity(0.4))
                }
            }
            .options(options)
             // The padding around each page
             // you can use `.fractionalWidth` and
             // `.fractionalHeight` too
             .pagePadding(
                 vertical: .absolute(60),
                 horizontal: .absolute(40)
             )
            
            if showDetail {
                
                DetailView(selectHouse: $selectHouse, showDetail: $showDetail)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
