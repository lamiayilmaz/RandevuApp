//
//  DropDowns.swift
//  Randevu Sistemi
//
//  Created by Lamia Yılmaz 
//

import SwiftUI

public struct DropDowns: View {
    @Binding  var selectedCity : String
    @Binding  var selectedDistrict : String
    
    public var body: some View {
        VStack{
            DropDownView(Selections:$selectedCity, prompt:"Şehir seçiniz",options:City.Cities)
            
            if selectedCity == "İstanbul"{
                DropDownView(Selections:$selectedDistrict,prompt:"İlçe seçiniz",options:City.Districtsİ)
            } else if selectedCity == "Ankara"{
                DropDownView(Selections:$selectedDistrict,prompt:"İlçe seçiniz",options:City.DistrictsA)
            } else if selectedCity == "Muğla"{
                DropDownView(Selections:$selectedDistrict,prompt:"İlçe seçiniz",options:City.DistrictsM)
                
            }
            Spacer()
            
        }.frame(alignment: .topLeading)
            .offset(x:-100,y:20)
    }
}
public struct RandevuAlmaButton: View {
    @State var shouldNavigateToUserPanel: Bool = false
    @State private var selectedTitle: String? = nil
    @State private var selectedTime: String? = nil
    @State var isSelected: Bool = false
    @State var isCheckedA: Bool = false
    @State var isCheckedB: Bool = false
    @State var selectedCity: String
    @State var selectedDistrict: String
    @State private var date = Date()
    @State var avaliableTimes_1:[String] = ["10:00","11:00","13:00","14:00"]
    @State var avaliableTimes_2:[String] = ["15:00","16:00","17:00","18:00"]
    @State var button_text:[String] = ["Muayene","Tedavi"]
    public var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 20){
                    DropDowns(selectedCity: $selectedCity, selectedDistrict:$selectedDistrict)
                    VStack{
                        if selectedCity == "İstanbul" && selectedDistrict == "Beykoz"{
                            Text("Lütfen randevu almak istediğiniz kliniği seçiniz")
                                .foregroundStyle(.red)
                                .offset(x:110,y:0)
                            CheckboxA(label: "Klinik-A", isCheckedA: $isCheckedA)
                                .onChange(of: isCheckedA) {
                                    if isCheckedA {
                                        isCheckedB = false
                                    }
                                }
                            CheckboxB(label: "Klinik-B", isCheckedB: $isCheckedB)
                        }
                        else if selectedCity == "İstanbul" && selectedDistrict == "Esenler"{
                            Text("Lütfen randevu almak istediğiniz kliniği seçiniz")
                            CheckboxA(label: "Klinik-C", isCheckedA: $isCheckedA)
                                .onChange(of: isCheckedA) {
                                    if isCheckedA {
                                        isCheckedB = false
                                    }
                                }
                            CheckboxB(label: "Klinik-D", isCheckedB: $isCheckedB)
                        }
                        else if selectedCity == "Ankara" && selectedDistrict == "Etimesgut"{
                            Text("Lütfen randevu almak istediğiniz kliniği seçiniz")
                            CheckboxA(label: "Klinik-E", isCheckedA: $isCheckedA)
                                .onChange(of: isCheckedA) {
                                    if isCheckedA {
                                        isCheckedB = false
                                    }
                                }
                            CheckboxB(label: "Klinik-F", isCheckedB: $isCheckedB)
                        }
                        else if selectedCity == "Ankara" && selectedDistrict == "Çankaya"{
                            Text("Lütfen randevu almak istediğiniz kliniği seçiniz")
                            CheckboxA(label: "Klinik-I", isCheckedA: $isCheckedA)
                                .onChange(of: isCheckedA) {
                                    if isCheckedA {
                                        isCheckedB = false
                                    }
                                }
                            CheckboxB(label: "Klinik-İ", isCheckedB: $isCheckedB)
                        }
                        else if selectedCity == "Muğla" && selectedDistrict == "Fethiye"{
                            Text("Lütfen randevu almak istediğiniz kliniği seçiniz")
                            CheckboxA(label: "Klinik-J", isCheckedA: $isCheckedA)
                                .onChange(of: isCheckedA) {
                                    if isCheckedA {
                                        isCheckedB = false
                                    }
                                }
                            CheckboxB(label: "Klinik-K", isCheckedB: $isCheckedB)
                        }
                        else if selectedCity == "Muğla" && selectedDistrict == "Marmaris"{
                            Text("Lütfen randevu almak istediğiniz kliniği seçiniz")
                            CheckboxA(label: "Klinik-L", isCheckedA: $isCheckedA)
                                .onChange(of: isCheckedA) {
                                    if isCheckedA {
                                        isCheckedB = false
                                    }
                                }
                            CheckboxB(label: "Klinik-M", isCheckedB: $isCheckedB)
                        }
                    }.offset(x:-130,y:0)
                    Spacer()
                    Text("RANDEVU TARİHİ SEÇİMİ")
                        .font(.title)
                        .foregroundStyle(.blue)
                        .offset(x:-40,y:0)
                    DatePicker(
                        "",
                        selection: $date,
                        displayedComponents: [.date]
                    ).datePickerStyle(.graphical)
                    
                    Text("RANDEVU SAATİ")
                        .offset(x:-90,y:0)
                        .font(.title)
                        .foregroundStyle(.blue)
                    HStack{
                        ForEach(avaliableTimes_1,id: \.self){time in
                            PrimaryHourButton(time:time,action:{selectedTime = time},isSelected :selectedTime == time)
                        }
                    }
                    HStack{
                        ForEach(avaliableTimes_2,id: \.self){time in
                            PrimaryHourButton(time:time,action:{selectedTime=time},isSelected :selectedTime == time)
                        }
                    }
                    Text("RANDEVU TÜRÜ")
                        .offset(x:-90,y:0)
                        .font(.title)
                        .foregroundStyle(.blue)
                    HStack{
                        ForEach(button_text,id: \.self){title in
                            PrimaryButton(title:title,action:{selectedTitle=title},isSelected:selectedTitle == title)
                            
                        }
                    }
                    PrimaryButton(title:"Randevu Oluştur",action:{shouldNavigateToUserPanel=true},isSelected:false)
                }
            }
            
        }.navigationDestination(isPresented: $shouldNavigateToUserPanel){UserPanel()}
    }
}

#Preview{
    RandevuAlmaButtonWrapper()
}

struct RandevuAlmaButtonWrapper: View {
    @State private var selectedCity = ""
    @State private var selectedDistrict = ""
    
    var body: some View {
        RandevuAlmaButton(selectedCity: selectedCity, selectedDistrict: selectedDistrict)
    }
}
    
    

