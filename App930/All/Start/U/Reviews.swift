//
//  Reviews.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("Reviews")
                    .resizable()
                
                VStack(spacing: 20) {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top)
                        .multilineTextAlignment(.center)
                    
                    Text("Help make the app even better")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .padding(.bottom, 40)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 320)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    Reviews()
}
