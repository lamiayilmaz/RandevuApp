//
//  kullaniciModel.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz 
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var email: String
    var sifre: String
    var kullanıcıTip: String
}

