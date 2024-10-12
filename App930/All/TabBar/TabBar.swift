//
//  TabBar.swift
//  App930
//
//  Created by IGOR on 12/10/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim2") : Color.gray)
                            .frame(width: 15, height: 15)

//                        Text(index.rawValue)
//                            .foregroundColor(selectedTab == index ? Color("prim") : Color.gray)
//                            .font(.system(size: 13, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 28)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color.black))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    
    case Calendar = "Calendar"
    
    case Contests = "Contests"
            
}
