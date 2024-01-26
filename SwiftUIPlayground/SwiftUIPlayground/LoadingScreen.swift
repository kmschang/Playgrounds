//
//  LoadingScreen.swift
//  SwiftUIPlayground
//
//  Created by Kyle Schang on 1/22/24.
//

import SwiftUI

struct LoadingScreen: View {
    
    var themeColor:UIColor = UIColor(red: 214/255, green: 1/255, blue: 64/255, alpha: 1.00)
    var backgroundColor:UIColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1.00)
    
    var body: some View {
        
        ZStack {
            
            Color(uiColor: .black)
                .ignoresSafeArea()
            
            VStack(content: {
                
                Text("Discount Calculator")
                    .foregroundStyle(Color(uiColor: .white))
                    .font(.system(size:55, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Image("TransparentAppLogo")
                    .resizable()
                    .frame(minWidth: 30, idealWidth: 128, maxWidth: .infinity, minHeight: 30, idealHeight: 128, maxHeight: .infinity, alignment: .center)
                    .aspectRatio(1.0, contentMode: .fit)
                    .padding(50)
                
                Spacer()
                
                Text("For Grandma")
                    .foregroundStyle(Color(uiColor: .white))
                    .font(.system(size: 20, weight: .heavy))
                    .frame(alignment: .center)
                
                ZStack {
                    
                    HStack {
                        Image("WhiteLogo")
                            .resizable()
                            .frame(minWidth: 0, idealWidth: 50, maxWidth: 50, minHeight: 0, idealHeight: 50, maxHeight: 50, alignment: .center)
                            .aspectRatio(1.0, contentMode: .fit)
                            .padding(.leading, 30)
                        
                        Spacer()
                    }
                    
                    Text("Sonnaz Group")
                        .foregroundStyle(Color(uiColor: .white))
                        .font(.system(size: 25, weight: .heavy))
                        .frame(alignment: .center)
                }
                
                
            })
        }
        
    }
}

#Preview {
    LoadingScreen()
}
