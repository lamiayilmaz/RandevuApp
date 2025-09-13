//
//  UserAuthView.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz 
//

import SwiftUI
import Firebase
import FirebaseAuth
struct UserAuthView: View {
    @StateObject private var viewModel = userViewModel()
    @State private var email: String = ""
    @State private var sifre: String = ""
    @State var shouldNavigateToSignUp: Bool = false
    @Binding var shouldNavigateToPanel: Bool
    @State var isSelected: Bool = false
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
                        .offset(x:0,y:-90)
                    
                    
                    Image("whiteuser")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .padding(.top, 30)
                        .offset(x:0,y:-90)
                    
                    Group{
                        TextField("E-mail",text:$email)
                            .padding()
                        
                        TextField("Şifre",text:$sifre)
                            .padding()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .foregroundColor(.red)
                        .font(.caption)
                        .offset(x:0,y:-60)
                                       }
              
                    
                PrimaryButton(title: "Giriş Yap",action:{login();shouldNavigateToPanel = true;
                    isSelected = true})
                    
                        .padding(.horizontal)
                        .offset(x:0,y:270)
                    
                    Text("Hesabınız mı yok?")
                        .foregroundStyle(.black.opacity(0.5))
                        .offset(x:0,y:320)
                Button(action: {shouldNavigateToSignUp = true; isSelected = true}) {
                        Text("Kayıt Ol")
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                    }
                    .padding(.horizontal)
                    .offset(x:0,y:350)
                    
                    
                    Spacer()
                }
                
            }
            .navigationDestination(isPresented: $shouldNavigateToSignUp) {
                SignUpView()
            }
        }
    //FirebaseAuthentication ile kullanıcının girdiği email ve şifre ile giriş yaptırılır
    func login(){
        Auth.auth().signIn(withEmail: email, password: sifre){result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
            let uid = Auth.auth().currentUser?.uid
            viewModel.uid = uid
        }
        viewModel.fetchUserType{type in
            print("Tip başarıyla çekildi.")
        }
   }
    }


#Preview {
    UserAuthView(shouldNavigateToPanel:.constant(true))
}
