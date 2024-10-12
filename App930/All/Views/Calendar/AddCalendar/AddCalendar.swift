//
//  AddCalendar.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct AddCalendar: View {

    @StateObject var viewModel: CalendarViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add to calendar")
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
                        
                        Text("Enter date")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("11.11.11")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.calDate.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.calDate)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                        
                        Text("Climbs")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.calClimbs.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.calClimbs)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                        
                        Text("Cost ski pass")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.calCost.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.calCost)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                        
                        Text("Location")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.calLoc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.calLoc)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                        
                        Text("Lift Name")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.calLName.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.calLName)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                        
                        Text("Equipment")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.calEq.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.calEq)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))

                    }
                }
                
                Button(action: {
                    
                    viewModel.addCal()
                    
                    viewModel.calDate = ""
                    viewModel.calClimbs = ""
                    viewModel.calCost = ""
                    viewModel.calLoc = ""
                    viewModel.calLName = ""
                    viewModel.calEq = ""
                    
                    viewModel.fetchCals()
                    
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
                .opacity(viewModel.calDate.isEmpty || viewModel.calClimbs.isEmpty || viewModel.calCost.isEmpty || viewModel.calLoc.isEmpty || viewModel.calLName.isEmpty || viewModel.calEq.isEmpty ? 0.5 : 1)
                .disabled(viewModel.calDate.isEmpty || viewModel.calClimbs.isEmpty || viewModel.calCost.isEmpty || viewModel.calLoc.isEmpty || viewModel.calLName.isEmpty || viewModel.calEq.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddCalendar(viewModel: CalendarViewModel())
}
