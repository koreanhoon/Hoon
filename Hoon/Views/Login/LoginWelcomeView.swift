//
//  LoginWelcomeView.swift
//  Hoon
//
//  Created by Ryan Lee on 2022/10/10.
//

import SwiftUI
import AVKit

struct LoginWelcomeView: View {
    
    @Binding var currentStep: LoginStep
    
    @State var isPlayed = true
    
    var body: some View {
        ZStack {
            
            // Video Player from the main bundle
            let player = AVPlayer(url:  Bundle.main.url(forResource: "LoginWelcomeVideo", withExtension: "mp4")!)
            if  player != nil {
                
                CustomVideoPlayer(player: player)
                    .onAppear {
                        player.play()
                    }
                    .onTapGesture {
                        isPlayed.toggle()
                        if isPlayed {
                            player.play()
                        } else {
                            player.pause()
                        }
                    }
            }
            
            // Button
            VStack{
                HStack{
                    Spacer()
                    Button {
                        currentStep = .signUp
                        player.pause()
                    } label: {
                        Text("Skip")
                    }
                }
                Spacer()
                Button {
                    currentStep = .signUp
                    player.pause()
                } label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .frame(height: 100)
                        Text("Tadah")
                            .foregroundColor(.black)
                    }
                }

            }
        }
        .ignoresSafeArea()
    }
}
//
//struct LoginWelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginWelcomeView()
//    }
//}
