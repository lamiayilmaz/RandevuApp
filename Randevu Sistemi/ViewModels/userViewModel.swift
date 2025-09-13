//
//  Untitled.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz 
//

import SwiftUI
import FirebaseDatabase

class userViewModel: ObservableObject {
    static let shared = userViewModel()
    @Published var uid: String?
    @Published var users: [user] = []
    //Başka bir view'da kullanılan değişkeni buraya aktarabilmek için observableobject yaptık ve view'da stateobject olarak tanımladık sonrasında ise nesne üstünden değişkenin değerine ulaştık ve viewmodele aktardık.
    @Published var mySelection: String = "Müşteri"
    @Published var email: String = ""
    @Published var sifre: String = ""
    //ViewModel ilk oluşturulduğunda fetchUsers fonksiyonu çağırılıyor ve kullanıcılar hemen çekiliyor.
    init(){
        
    }
    //Kullanıcıları çekip listeye koyar.
    func fetchUsers(email:String, password:String, usertype:String){
        let ref = Database.database().reference().child("users")
        
        //snapshot --> tüm belge verileri
        ref.observeSingleEvent(of: .value){ snapshot in
            guard snapshot.exists() else {
                print("Hiç kullanıcı bulunamadı")
                return
            }
            DispatchQueue.main.async {
                self.users.removeAll()
            }
            
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                   let userData = snapshot.value as? [String: Any] {
                    
                    guard let email = userData["email"] as? String,
                          let password = userData["sifre"] as? String,
                          let usertype = userData["usertype"] as? String else {
                        continue
                    }
                    
                    let user = user(email: email, sifre: password, mySelection: usertype)
                    
                    DispatchQueue.main.async {
                        self.users.append(user)
                    }
                }
            }
            
            
            
        }
        
    }
    
    func fetchUserType(completion: @escaping (String?) -> Void) {
           guard let uid = uid else {
               completion(nil)
               return
           }

           let ref = Database.database().reference()
           ref.child("users").child(uid).child("usertype")
               .observeSingleEvent(of: .value) { snapshot in
                   if let type = snapshot.value as? String {
                       DispatchQueue.main.async {
                           self.mySelection = type
                           completion(type)
                       }
                   } else {
                       completion(nil)
                   }
               }
       }
}


