//
//  Untitled.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz 
//

import SwiftUI
struct Untitled: View {
    var body: some View {VStack{
        Text("Dental Randevu")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(LinearGradient(
                colors: [Color.blue, Color.cyan],
                startPoint: .leading,
                endPoint: .trailing
            ))
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                
            )
    }
        
    }
}

#Preview {
    
}
