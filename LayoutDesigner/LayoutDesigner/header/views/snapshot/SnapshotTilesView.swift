//
//  SnapshotTilesView.swift
//  SnapshotTilesView
//
//  Created by Andrej Kling on 13.08.21.
//

import SwiftUI
import CollectionViewPagingLayout

struct SnapshotTilesView: View {
    
    @State private var selectHouse : Reality = houses[0]
    @State private var showDetail = false
    
    // Use the options to customize the layout
    var options: SnapshotTransformViewOptions {
        .layout(.tiles)
    }
    
    var body: some View {
        
        ZStack {
            
            SnapshotPageView(houses)  { house in
                
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
                vertical: .absolute(100),
                horizontal: .absolute(80)
            )
            
            if showDetail {
                
                DetailView(selectHouse: $selectHouse, showDetail: $showDetail)
            }
        }
    }
}

struct SnapshotTilesView_Previews: PreviewProvider {
    static var previews: some View {
        SnapshotTilesView()
    }
}
