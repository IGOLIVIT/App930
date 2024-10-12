//
//  HomeView.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Home")
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Text("Best result")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isResult = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color("prim"))
                        })
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Distance (km)")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 12, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(viewModel.dist)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold))
                                
                            }
                            .padding()
                            .frame(width: 150, height: 110, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                            
                            VStack(alignment: .leading) {
                                
                                Text("Time")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 12, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(viewModel.time)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold))
                                
                            }
                            .padding()
                            .frame(width: 150, height: 110, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                            
                            VStack(alignment: .leading) {
                                
                                Text("Average speed (km/h)")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 12, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(viewModel.avSpeed)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30, weight: .bold))
                                
                            }
                            .padding()
                            .frame(width: 150, height: 110, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                        }
                    }
                    .frame(height: 120)
                    
                    HStack {
                        
                        Text("Goals")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isGoals = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color("prim"))
                        })
                    }
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Time goal")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 12, weight: .regular))
                            
                            Spacer()
                            
                            Text("\(viewModel.gtime)")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 110)                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                        
                        VStack(alignment: .leading) {
                            
                            Text("Descents per month")
                                .foregroundColor(.white.opacity(0.5))
                                .font(.system(size: 12, weight: .regular))
                            
                            Spacer()
                            
                            Text("\(viewModel.descents)")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 110)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                        
                    }
                    
                    HStack {
                        
                        Text("Lifts in a year")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isLifts = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color("prim"))
                        })
                    }
                    .padding(.vertical)
                    
                    VStack {
                        
                        ZStack {
                            
                            VStack {
                                
                                Text("Time record")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("\(viewModel.lifts)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 32, weight: .semibold))
                                
                                Text("/\(viewModel.goal)")
                                    .foregroundColor(.white.opacity(0.5))
                                    .font(.system(size: 32, weight: .semibold))
                                
                            }
                            
                            Circle()
                                .stroke(Color.white.opacity(0.2), lineWidth: 8)
                                .frame(width: 220, height: 220)
                                .padding()
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(viewModel.calculatePercentage() / 100))
                                .stroke(Color("prim"), lineWidth: 8)
                                .frame(width: 220, height: 220)
                                .rotationEffect(.degrees(-90))
                            
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim2")))
                    
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isResult, content: {
            
            ResultView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isGoals, content: {
            
            GoalView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isLifts, content: {
            
            LiftsView(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
