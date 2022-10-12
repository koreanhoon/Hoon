//
//  LoginContainerView.swift
//  Hoon
//
//  Created by Ryan Lee on 2022/10/12.
//

import SwiftUI

enum LoginStep: Int {
    
    case welcome = 0
    case signUp = 1
    case signIn = 2
}

struct LoginContainerView: View {
    
    @Binding var isLogin: Bool
    @State var currentStep: LoginStep = .welcome
    
    var body: some View {

        ZStack {
            
            switch currentStep {
            case .welcome:
                LoginWelcomeView(currentStep: $currentStep)
            case .signUp:
                SignUpView(currentStep: $currentStep)
            case .signIn:
                SignInView(currentStep: $currentStep)
            }
            
        }
    }
}
//
//struct LoginContainerView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginContainerView()
//    }
//}
