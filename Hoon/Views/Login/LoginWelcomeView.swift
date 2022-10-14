//
//  LoginWelcomeView.swift
//  Hoon
//
//  Created by Ryan Lee on 2022/10/10.
//

import SwiftUI
import AVKit

class VideoPlayer : ObservableObject {
    
}

struct LoginWelcomeView: View {
    
    @Binding var currentStep: LoginStep
    
    @State var isPlayed = true
    @State var isWatched = false
    @State var isCompleted = false
    
    @State var t = 0.0
    
    let playerDidFinishNotification = NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)
        
    var body: some View {
        
        let player = AVPlayer(url:  Bundle.main.url(forResource: "LoginWelcomeVideo", withExtension: "mp4")!)

        ZStack {
            
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
                .ignoresSafeArea()

            // Button
            VStack{
                HStack{
                    Spacer()
                    Button {
                        isCompleted = true
                        currentStep = .signUp
                    } label: {
                        Text("Skip")
                    }
                    .tint(.white)
                }
                Spacer()
                Button {
                    if isWatched {
                        isCompleted = true
                        currentStep = .signUp
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(isWatched ? .white : .gray)
                            .frame(height: 70)
                            .shadow(radius: 5,y:-5)
                        Image(isWatched ? "party-popper" : "speech-balloon")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    }
                }
                .padding(.bottom, 80)
            }
            .padding()
        }
        .onReceive(playerDidFinishNotification, perform: { _ in
                isWatched = true
            })
        .onChange(of: isCompleted) { _ in
            player.pause()
        }
    }
        
}

//
//struct LoginWelcomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginWelcomeView()
//    }
//}
