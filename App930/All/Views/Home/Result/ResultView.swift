//
//  ResultView.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct ResultView: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Best result")
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
                            
                            Text("Distance (km)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.distAdd.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.distAdd)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                            
                            Text("Time")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.timeAdd.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.timeAdd)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                            
                            Text("Average speed (km/h)")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.avSpeedAdd.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.avSpeedAdd)
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
                    
                    viewModel.dist = viewModel.distAdd
                    viewModel.time = viewModel.timeAdd
                    viewModel.avSpeed = viewModel.avSpeedAdd
                    
                    viewModel.distAdd = ""
                    viewModel.timeAdd = ""
                    viewModel.avSpeedAdd = ""
                    
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
    ResultView(viewModel: HomeViewModel())
}
