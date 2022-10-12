//
//  ContentView.swift
//  Hoon
//
//  Created by Ryan Lee on 2022/10/10.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .home
    @State var isLoggedIn = !AuthViewModel.isUserLoggedIn()
        
    var body: some View {
        
        ZStack {
            
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
                
                switch selectedTab {
                case .home:
                    LessonView()
                case .modules:
                    ModuleView()
                case .profile:
                    ProfileView()
                }
                
                Spacer()
                
                CustomTabBar(selecteTab: $selectedTab)
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .padding(.top,2)
                    .overlay(Divider(),alignment: .top)
                    .background(selectedTab == .home ? .black : .white)

                
            }
            
        }
        .onAppear {
            if !isLoggedIn {
                // User has already onboarded, load lessons
            }
        }
        .fullScreenCover(isPresented: $isLoggedIn) {
            LoginContainerView(isLogin: $isLoggedIn)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
