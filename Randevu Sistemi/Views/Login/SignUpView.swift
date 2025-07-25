//
//  test.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/21/25.
//

import SwiftUI
import Combine

struct SignUpView: View {
    @State var shouldNavigateToSignUp: Bool = false
    @ObservedObject var signUpViewModel = SignUpViewModel()
    @State  private var mySelection = "Müşteri"{
        didSet{
            if mySelection == "Asistan"{
                signUpViewModel.kullanıcıTip = .asistan
            }else{
                signUpViewModel.kullanıcıTip = .müşteri
            }
        }
    }
        
    var options = ["Asistan","Müşteri"]
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                VStack{
                    Picker("Form Selection", selection: $mySelection){
                        ForEach(options,id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                        .frame(maxWidth:UIScreen.main.bounds.width - 50)
                    
                    VStack{
                        Spacer()
                        Text("Hesap Oluştur")
                            .font(.title)
                            .fontWeight(.bold)
                        Group{
                            TextField("Adınız", text: $signUpViewModel.ad)
                            TextField("Soyadınız", text:
                                        $signUpViewModel.soyad )
                            TextField("E-posta adresiniz", text: $signUpViewModel.email)
                            TextField("Şifreniz", text: $signUpViewModel.sifre)
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(5)
                        
                        HStack {
                            //NavigationLink(destination:EmailLogin(email:signUpViewModel.email,sifre:signUpViewModel.sifre),
                                           PrimaryButton(title:"Kayıt Ol", action:{shouldNavigateToSignUp = true})
                        }
                            
                        }
                        Spacer() }
                }
        
        }.navigationDestination(isPresented: $shouldNavigateToSignUp) {
            EmailLogin(email:signUpViewModel.email,sifre:signUpViewModel.sifre)
    }
        
    }
}

#Preview {
    SignUpView()
}

