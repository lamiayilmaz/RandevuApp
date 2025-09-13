//
//  ContentView.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz 
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = userViewModel()
    @State var shouldNavigateToPanel: Bool = false
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                VStack{
                    UserAuthView(shouldNavigateToPanel: $shouldNavigateToPanel)
                    
                }
            }
        }.navigationDestination(isPresented: $shouldNavigateToPanel){if viewModel.mySelection == "Müşteri"{
            UserPanel()
        }
            else if viewModel.mySelection == "Asistan"{
                AsistantPanel()
            }
        }
    }
}
    #Preview {
        ContentView()
    }
