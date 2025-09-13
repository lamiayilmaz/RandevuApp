//
//  Şehir Drop Down.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/25/25.
//

import SwiftUI

struct DropDownView:View{
    @State private var isExpanded = false
    @Binding var Selections:String
    var prompt:String
    var options:[String]
    var body:some View{
        VStack{
            HStack{
                Text(Selections.isEmpty ? prompt : Selections)
                    .font(.footnote)
                    .font(.system(size:24))
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundStyle(.gray)
                    .rotationEffect(.degrees(isExpanded ? -180:0))
            }.frame(width:150,height: 40)
                .padding(.horizontal)
                .onTapGesture{withAnimation(.snappy){isExpanded.toggle()}}
            if isExpanded == true {
                VStack{
                    ForEach(options, id: \.self){option in
                        HStack{
                            Text(option)
                                .foregroundStyle(Selections == option ? Color.primary:.gray)
                            Spacer()
                            if Selections == option{
                                Image(systemName: "checkmark")
                                    .foregroundStyle(.gray)
                            }
                            
                        }.frame(width:150,height: 40)
                            .padding(.horizontal)
                            .onTapGesture {
                            Selections = option
                                isExpanded.toggle()
                            }
                        
                    }
                }
            }
        }.background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius:4)
        
    }
}
#Preview{
    DropDownView(Selections: .constant("İstanbul"), prompt: "Şehir seçiniz",options:["İstanbul","Ankara","Muğla"])
}

//Lamia first commit
