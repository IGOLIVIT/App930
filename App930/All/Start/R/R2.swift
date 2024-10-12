//
//  R2.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                
                VStack(spacing: 20) {
                    
                    Text("Organize your ski training")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                        .padding(.top)
                    
                    Text("Plan sessions and track progress easily")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    R2()
}
