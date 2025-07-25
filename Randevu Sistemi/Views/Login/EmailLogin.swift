//
//  EmailLogin.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/21/25.
//

import SwiftUI

struct EmailLogin:View{
    @State var email:String=""
    @State var sifre:String=""
    
    public var body:some View{
        
        VStack(spacing:20){
            Text("Giriş Yapınız")
                .font(.title)
            VStack(spacing:20){
                TextField("Email Adresi",text:$email)
                SecureField("Şifre",text:$sifre)
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(5)
            VStack(spacing:20){
                PrimaryButton(title: "Giriş yap", action: {
                    print("Lamia first componenet")
                })
            }
        }
    }
}

#Preview {
    EmailLogin()
}
   

