//
//  ShapeTesting.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 2/20/24.
//

import SwiftUI



struct ShapeTesting: View {
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            
            Image("Calendar")
                .resizable()
                .frame(width: 350, height: 350, alignment: .center)
            
            VStack {
                Spacer()
                Text("Day")
                    .foregroundStyle(Color(uiColor: .white))
                    .font(.system(size: 90, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .padding(.top, -75)
                Text("366")
                    .foregroundStyle(Color(uiColor: .black))
                    .font(.system(size: 150, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, -25)
                Spacer()
            }
                   
            
               
            
        }
    }
}



#Preview {
    ShapeTesting()
}
