//
//  LoadingScreen2.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 1/25/24.
//

import SwiftUI

struct LoadingScreen2: View {
    var body: some View {
        
        ZStack(content: {
            
            VStack(content: {
                Text("Discount Calculator")
                    .font(.system(size: 55, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                Spacer()
                Image("DC_WhiteLogo")
                    .resizable()
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    .padding(20)
                    .aspectRatio(1.0, contentMode: .fit)
                Spacer()
                Text("Sonnaz Group")
                    .font(.system(size: 20, weight: .heavy))
                    .padding(.bottom, 10)
            })
            
            
            
            
            
            
        })
        .background(Image("Background"))
    }
}

#Preview {
    LoadingScreen2()
}
