//
//  HoonApp.swift
//  Hoon
//
//  Created by Ryan Lee on 2022/10/10.
//

import SwiftUI
import Firebase

@main
struct HoonApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
