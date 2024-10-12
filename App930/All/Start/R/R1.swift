//
//  R1.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                
                VStack(spacing: 20) {
                    
                    Text("Track your best ski runs")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top)
                    
                    Text("Set goals and veat your records effortlessly")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        R2()
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
    R1()
}
