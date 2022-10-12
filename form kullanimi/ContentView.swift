//
//  ContentView.swift
//  form kullanimi
//
//  Created by Mert AKBAŞ on 12.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hatirlatmaAcikMi = false
    
    @State private var zamanListesi = ["1 Gün","1 Hafta","1 Ay"]
    @State private var secilmisZamanIndeks = 0
    
    @State private var odemeListesi = ["Haftalık","Aylık","Yıllık"]
    @State private var secilenOdemeIndeks = 0
    
    
    var body: some View {
        NavigationView{
            Form{
                
                Section(header: Text("Hatırlatma"), footer:Text("Bildirim sıklığını ayarlayabilirsiniz")){
                    
                    Picker(selection: $secilmisZamanIndeks, label: Text("")){
                        ForEach(0..<self.zamanListesi.count){
                            Text(self.zamanListesi[$0]).tag($0)
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    
                    Toggle(isOn:$hatirlatmaAcikMi){
                        Text("Hatırlatma Kapat")
                    }
                }
                
                Section(footer:Text("Ödeme sıklığını ayarlayabilirsiniz")){
                    
                    Picker(selection: $secilenOdemeIndeks, label: Text("Ödeme Sıklığı")){
                        ForEach(0..<self.odemeListesi.count){
                            Text(self.odemeListesi[$0]).tag($0)
                        }
                        
                    }
                    
                    
                }
                
                Section{
                    
                    Button(action:{
                        
                        print("Hatırlatma : \(self.zamanListesi[self.secilmisZamanIndeks])")
                        
                        print("Hatırlatma  Açık Mı : \(self.hatirlatmaAcikMi)")
                        
                        print("Ödeme Sıklığı : \(self.odemeListesi[self.secilenOdemeIndeks])")
                        
                        
                        
                    }){
                        Text("Değişiklikleri Kaydet")
                    }
                    
                    
                }
                
                
            }.navigationBarTitle("Ayarlar")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
