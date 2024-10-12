//
//  GoalView.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct GoalView: View {

    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Goals")
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
                            
                            Text("Time")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.gtimeAdd.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.gtimeAdd)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                            
                            Text("Descents")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .medium))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.descentsAdd.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.descentsAdd)
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
                    
                    viewModel.gtime = viewModel.gtimeAdd
                    viewModel.descents = viewModel.descentsAdd
                    
                    viewModel.gtimeAdd = ""
                    viewModel.descentsAdd = ""
                    
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
    GoalView(viewModel: HomeViewModel())
}
