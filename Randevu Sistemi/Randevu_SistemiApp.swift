//
//  Randevu_SistemiApp.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/17/25.
//

import SwiftUI
import Firebase

@main
struct Randevu_SistemiApp: App {

    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
