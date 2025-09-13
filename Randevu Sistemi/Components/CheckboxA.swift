//
//  Checkbox.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz on 7/29/25.
//

import SwiftUI

struct CheckboxA: View {
    let label: String
    @Binding var isCheckedA:Bool
    var body: some View {
        Button(action: {isCheckedA.toggle()}){
            HStack{
                Image(systemName: isCheckedA ? "checkmark.circle.fill" :"checkmark.circle")
                    .foregroundColor(.blue)
                Text(label)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview{
    StatefulPreviewWrapper(false) { isCheckedA in
        CheckboxA(label: "test", isCheckedA: isCheckedA)
    }
}
