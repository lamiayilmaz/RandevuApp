//
//  test.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz 
//

import SwiftUI
import Combine
import Firebase
import FirebaseAuth
import FirebaseDatabase

struct SignUpView: View {
    @State var shouldNavigateToEmail: Bool = false
    @StateObject private var viewModel = userViewModel()
    var options = ["Asistan","Müşteri"]
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue, .mint]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all)
                VStack{
                    Picker("Form Selection", selection: $viewModel.mySelection){
                        ForEach(options,id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                        .frame(maxWidth:UIScreen.main.bounds.width - 50)
                    
                }
                VStack{
                    Spacer()
                    Text("Hesap Oluştur")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(x:0,y:-400)
                    Group{
                        TextField("E-posta adresiniz", text:$viewModel.email)
                        TextField("Şifreniz", text:$viewModel.sifre)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
                    .offset(x:0,y:-200)
                    
                    HStack {
                        PrimaryButton(title:"Kayıt Ol", action:{register(email: viewModel.email, password: viewModel.sifre){DispatchQueue.main.async {
                            shouldNavigateToEmail = true}}})
                    }.offset(x:0,y:-200)
                    
                }
                Spacer() }
        }.navigationDestination(isPresented:$shouldNavigateToEmail) {
            EmailLogin(email:viewModel.email,sifre:viewModel.sifre)
            
        }
    }
    
    
    
    
    //FirebaseAuthentication kullanılarak kullanıcının girdiği email ve şifre ile kullanıcı kaydedilir
    func register(email:String, password: String,completion: @escaping () -> Void) {
        //soldaki veri firestore'dan çekilen sağdaki veri ile doldurulur
        Auth.auth().createUser(withEmail: viewModel.email,password: viewModel.sifre){result, error in
            if let error = error {
                       print("Kayıt hatası: \(error.localizedDescription)")
                       return
                   }

                   guard let userID = result?.user.uid else { return }
            self.viewModel.uid = userID
            let ref = Database.database().reference()
                   let userData: [String: Any] = [
                    "email": viewModel.email,
                    "sifre": viewModel.sifre,
                    "usertype":self.viewModel.mySelection
                   ]
            ref.child("users").child(userID).setValue(userData) { error, _ in
                        if let error = error {
                            print("Realtime DB yazma hatası: \(error.localizedDescription)")
                        } else {
                            print("Kullanıcı başarıyla Realtime DB'e eklendi.")
                            completion()
                        }
                    }
            }}
    }
#Preview {
    SignUpView()
}

