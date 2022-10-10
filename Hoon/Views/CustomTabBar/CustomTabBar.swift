//
//  CustomTabBar.swift
//  Hoon
//
//  Created by Ryan Lee on 2022/10/10.
//

import SwiftUI

enum Tabs: Int {
    case home = 0
    case modules = 1
    case profile = 2
}

struct CustomTabBar: View {
    
    @Binding var selecteTab: Tabs
    
    var body: some View {

        HStack {
            Spacer()
            Button {
                selecteTab = .home
            } label: {
                Image(systemName: selecteTab == .home ? "house.fill" : "house")
                    .font(.title2)
                    .foregroundColor(selecteTab == .home ? .white : .black)
            }
            Spacer()

            Button {
                selecteTab = .modules
            } label: {
                Image(systemName: selecteTab == .modules ? "book.fill" : "book")
                    .font(.title2)
                    .foregroundColor(selecteTab == .home ? .white : .black)


            }
            Spacer()

            Button {
                selecteTab = .profile
            } label: {
                Image(systemName: selecteTab == .profile ? "person.fill" : "person")
                    .font(.title2)
                    .foregroundColor(selecteTab == .home ? .white : .black)

            }
            Spacer()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selecteTab: .constant(.home))
    }
}
