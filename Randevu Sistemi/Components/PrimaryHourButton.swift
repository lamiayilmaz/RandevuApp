//
//  PrimaryHourButton.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz
//

import SwiftUI

struct PrimaryHourButton:View{
    var time:String
    var action: () -> Void
    var isSelected: Bool = false
    var body:some View{
        VStack{
            
            Button(action:action){
                Text(time)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width:80, height:30)
                    .background(isSelected ? Color.green :Color.blue)
                    .cornerRadius(10)
            }
        }
        
    }
    }


#Preview {
    PrimaryHourButton(time:"10:50", action:{},isSelected:false)
}
