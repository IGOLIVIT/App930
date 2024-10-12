//
//  LiftsView.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct LiftsView: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Lifts in a year")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    Button(action: {
                        
                        back.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                    })
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical)
                .padding(.bottom, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        VStack(spacing: 12) {
                            
                            Text("Lifts")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.liftsAdd.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.liftsAdd)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                            
                            Text("Goal")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.goalAdd.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.goalAdd)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                            
                        }
                    }
                }
                
                Button(action: {
                    
                    viewModel.lifts = Int(viewModel.liftsAdd) ?? 0
                    viewModel.goal = Int(viewModel.goalAdd) ?? 0
                    
                    viewModel.liftsAdd = ""
                    viewModel.goalAdd = ""
                    
                    withAnimation(.spring()) {
                        
                        back.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    LiftsView(viewModel: HomeViewModel())
}
