//
//  UserAuthView.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/18/25.
//

import SwiftUI
struct UserAuthView: View {
    
    @State var shouldNavigateToSignUp: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
                
                VStack(){
                    
                    Image("fairy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    
                    
                    Image("whiteuser")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .padding(.top, 30)
                    
                    Group{
                        TextField("E-mail",text:.constant(""))
                            .padding()
                        
                        TextField("Şifre",text:.constant(""))
                            .padding()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    PrimaryButton(title: "Giriş Yap",action:{})
                        
                    .padding(.horizontal)
                    
                    Text("Hesabınız mı yok?")
                        .foregroundStyle(.black.opacity(0.5))
                    Button(action: {
                        shouldNavigateToSignUp = true
                    }) {
                        Text("Kayıt Ol")
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                    }
                    .padding(.horizontal)

                
                    Spacer()
                }

            }
            .navigationDestination(isPresented: $shouldNavigateToSignUp) {
                SignUpView()
            }
        }
    }
}

#Preview {
    UserAuthView()
}
