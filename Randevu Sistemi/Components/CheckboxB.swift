//
//  CheckboxB.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/30/25.
//

import SwiftUI

struct CheckboxB: View {
    let label: String
    @Binding var isCheckedB:Bool
    var body: some View {
        Button(action: {isCheckedB.toggle()}){
            HStack{
                Image(systemName: isCheckedB ? "checkmark.circle.fill" :"checkmark.circle")
                    .foregroundColor(.blue)
                Text(label)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview{
    StatefulPreviewWrapper(false) { isCheckedB in
        CheckboxB(label: "test", isCheckedB: isCheckedB)
    }
}
