//
//  AddContest.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct AddContest: View {

    @StateObject var viewModel: ContestsViewModel
    @Environment(\.presentationMode) var back
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add")
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
                                .opacity(viewModel.conDate.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.conDate)
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
                                .opacity(viewModel.conClimbs.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.conClimbs)
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
                                .opacity(viewModel.conCost.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.conCost)
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
                                .opacity(viewModel.conLoc.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.conLoc)
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
                                .opacity(viewModel.conLift.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.conLift)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                        
                        Text("Note")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray.opacity(0.5))
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.conNote.isEmpty ? 1 : 0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            TextField("", text: $viewModel.conNote)
                                .foregroundColor(Color.white)
                                .font(.system(size: 16, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))

                    }
                }
                
                Button(action: {
                    
                    viewModel.addCont()
                    
                    viewModel.conDate = ""
                    viewModel.conClimbs = ""
                    viewModel.conCost = ""
                    viewModel.conLoc = ""
                    viewModel.conLift = ""
                    viewModel.conNote = ""
                    
                    viewModel.fetchConts()
                    
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
                .opacity(viewModel.conDate.isEmpty || viewModel.conClimbs.isEmpty || viewModel.conCost.isEmpty || viewModel.conLoc.isEmpty || viewModel.conLift.isEmpty || viewModel.conNote.isEmpty ? 0.5 : 1)
                .disabled(viewModel.conDate.isEmpty || viewModel.conClimbs.isEmpty || viewModel.conCost.isEmpty || viewModel.conLoc.isEmpty || viewModel.conLift.isEmpty || viewModel.conNote.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddContest(viewModel: ContestsViewModel())
}
