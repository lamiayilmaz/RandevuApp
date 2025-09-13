//
//  AsistantPanel.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz 
//

import SwiftUI
struct AsistantPanel:View{
    var body:some View{
        VStack{
            Image("yuvarlak")
                .resizable()
                .frame(width:90,height:90)
                .offset(x:-150,y:0)
            
            Image("fairy")
                .resizable()
                .frame(width: 90, height: 90)
                .offset(x:-149,y:-95)
                
            Text("𝘿𝙚𝙣𝙩𝙖𝙡 𝙍𝙖𝙣𝙙𝙚𝙫𝙪")
                .foregroundStyle(.pink)
                .offset(x:-50,y:-130)
        }.padding(.top,-200)
            VStack{
                HStack{
                    Group{
                        Button{}
                        label:{Text("Bekleyen Randevular")}
                        Button{}
                        label:{Text("Doktorun Programı")}
                    }.fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width:155,height:155)
                        .background(Color(red: 1.0, green: 0.7, blue: 0.8))
                        .cornerRadius(10)
                }
                Button{}
                label:{Text("Hasta Listesi")
                }.fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width:320,height:155)
                    .background(Color(red: 1.0, green: 0.7, blue: 0.8))
                    .cornerRadius(10)
            Button (action:{}){
                HStack{
                    Image(systemName:"rectangle.portrait.and.arrow.right")
                    Text("Çıkış Yap")
                    
                }
                .foregroundColor(.white)
                .frame(width: 322, height: 50)
                .background(Color.blue)
                .cornerRadius(20)
            }
        }
    }
    }

#Preview {
    AsistantPanel()
}
