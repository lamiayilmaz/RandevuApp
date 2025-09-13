//
//  EmailLogin.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/21/25.
//

import SwiftUI

struct EmailLogin:View{
    @StateObject private var viewModel = userViewModel()
    @State var shouldNavigateToPanel:Bool = false
    @State var email:String=""
    @State var sifre:String=""
    @State var mySelection:String?
    @State var userType:String? = nil
    
    public var body:some View{
        NavigationStack{
            VStack(spacing:20){
                Text("Giriş Yapınız")
                    .font(.title)
                VStack(spacing:20){
                    TextField("Email Adresi",text:$email)
                    SecureField("Şifre",text:$sifre)
                }.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
                VStack(spacing:20){
                    PrimaryButton(title: "Giriş yap", action: {viewModel.fetchUserType{_ in shouldNavigateToPanel = true}
                    },isSelected:true)
                    
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
    EmailLogin()
}
   

