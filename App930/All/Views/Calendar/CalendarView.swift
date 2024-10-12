//
//  CalendarView.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = CalendarViewModel()
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Calendar")
                        .foregroundColor(.white)
                        .font(.system(size: 36, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                }
                .padding(.bottom)
                
                if viewModel.calendars.isEmpty {
                    
                    VStack {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 36, weight: .bold))
                            .padding()
                        
                        Text("Nothing has been added to your calendar yet")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                            .frame(width: 170)
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.calendars, id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    HStack {
                                        
                                        Text(index.calDate ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedCal = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDelete = true
                                            }
                                            
                                        }, label: {
                                        
                                            Image(systemName: "trash.fill")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 17, weight: .regular))
                                        })
                                    }
                                    
                                    HStack {
                                        
                                        Image("point")
                                        
                                        Text(index.calLoc ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        Image("chel")
                                        
                                        Text(index.calLName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .regular))
                                    }
                                    
                                    Text("Ski pass: \(index.calCost ?? "")")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Text("Equipment")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text(index.calEq ?? "")
                                        .foregroundColor(.white.opacity(0.5))
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(7)
                                        .padding(.horizontal, 5)
                                        .background(RoundedRectangle(cornerRadius: 13).fill(.white.opacity(0.1)))
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Text("Climbs:")
                                            .foregroundColor(.white.opacity(0.3))
                                            .font(.system(size: 36, weight: .bold))
                                        
                                        Text(index.calClimbs ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 36, weight: .bold))
                                        
                                    }
                                    
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 300)
                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim2")))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchCals()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCalendar(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
               
                        CoreDataStack.shared.deleteCal(withCalLName: viewModel.selectedCal?.calLName ?? "", completion: {
                            
                            viewModel.fetchCals()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color(.white)))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    CalendarView()
}
