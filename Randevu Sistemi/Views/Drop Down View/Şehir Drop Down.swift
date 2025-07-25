//
//  Şehir Drop Down.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/25/25.
//

import SwiftUI

struct DropDownView:View{
    @State private var isExpanded = false
    var prompt:String
    var options:[String]
    var body:some View{
        VStack{
            HStack{
                Text(prompt)
                    .font(.caption)
                    .font(.system(size:24))
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundStyle(.gray)
                    .rotationEffect()
            }.frame(width:150,height: 40)
                .padding(.horizontal)
                .onTapGesture{withAnimation(.snappy){isExpanded.toggle()}}
        }
        
        
    }
}
#Preview{
    DropDownView(prompt:"Şehir seçiniz",options:["İstanbul","Ankara","Muğla"])
}


//Lamia first commit
