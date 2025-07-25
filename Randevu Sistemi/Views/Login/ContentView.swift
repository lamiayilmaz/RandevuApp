//
//  ContentView.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
            VStack{
                UserAuthView()
                    }
                }
               
            }
        }

#Preview {
    ContentView()
    
}
