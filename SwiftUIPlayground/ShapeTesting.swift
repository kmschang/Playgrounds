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
            
            Color.white
                .ignoresSafeArea()
            
            RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                .stroke(
                    Color.black,
                    style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round
                    )
                )
                    .frame(width: 300, height: 100, alignment: .center)
                    .overlay(
                        Text("Day")
                            .foregroundStyle(Color(uiColor: .red))
                            .font(.system(size: 80, weight: .heavy))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .top))
            
            RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                .stroke(
                    Color.black,
                    style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round
                    )
                )
                    .frame(width: 300, height: 300, alignment: .center)
                    .padding(.top, 200)
            
               
            
        }
    }
}

#Preview {
    ShapeTesting()
}
