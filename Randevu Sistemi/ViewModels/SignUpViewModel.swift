//
//  Untitled.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/23/25.
//

import Combine
import Foundation

class SignUpViewModel: ObservableObject {
    @Published var ad: String = ""
    @Published var soyad: String = ""
    @Published var email: String = ""
    @Published var sifre: String = ""
    @Published var kullanıcıTip: Selection = .müşteri
    @Published var hataMesajı: String? = nil
    @Published var kayıtlıKullanıcı : [user] = []
   
    func signUp() {
        guard !ad.isEmpty, !soyad.isEmpty, !email.isEmpty, !sifre.isEmpty else {
            hataMesajı = "Lütfen tüm alanları doldurunuz."
            return
        }
        guard email.contains(("@")) else {
            hataMesajı = "Lütfen email başına @ koymayı unutmayınız."
            return
        }
        
       let newUser = user(
        ad : ad,
        soyad : soyad,
        email : email,
        sifre : sifre,
        kullanıcıTip : kullanıcıTip.rawValue
       )
        kayıtlıKullanıcı.append(newUser)
        
        ad = ""
        soyad = ""
        email = ""
        sifre = ""
    }
}
