//
//  PrimaryButton.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/25/25.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color = Color(red: 1.0, green: 0.7, blue: 0.8)
    var textColor: Color = .pink
    var image: UIImage?
    
    var body: some View {
        
        HStack {
            Button(action: action) {
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    PrimaryButton(title: "Giriş Yap", action: {} )
}
