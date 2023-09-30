//
//  Home.swift
//  KartVeDetayVeAnimasyon
//
//  Created by Yaşar Duman on 19.09.2023.
//

import SwiftUI

struct Home: View {
    @State var suruklendi = 0
    @Namespace var name
    @State var seciliKart : Araclar = Araclar(id: 0, goruntuAdi: "sketch", aracAdi: "Sketch", offset: 0, sira: 1)
    @State var goster = false //Bir kartın detayları gosterilecekse tru yapılacak
    
    @State var tasarimAraclari = [
        Araclar(id: 0, goruntuAdi: "sketch", aracAdi: "Sketch", offset: 0, sira: 1),
        Araclar(id: 1, goruntuAdi: "figma", aracAdi: "Figma", offset: 0, sira: 2),
        Araclar(id: 2, goruntuAdi: "xd", aracAdi: "XD", offset: 0, sira: 3),
        Araclar(id: 3, goruntuAdi: "ilustrator", aracAdi: "Ilustrator", offset: 0, sira: 4),
        Araclar(id: 4, goruntuAdi: "ps", aracAdi: "Photoshop", offset: 0, sira: 5),
        Araclar(id: 5, goruntuAdi: "invision", aracAdi: "Invision", offset: 0, sira: 6),
        Araclar(id: 6, goruntuAdi: "affinity", aracAdi: "Affinity Photos", offset: 0, sira: 7)
    ]
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 12){
                        Text("Ürünler").font(.system(size: 45))
                            .fontWeight(.bold).foregroundStyle(.white)
                        
                        HStack(spacing: 15){
                            Text("Tasarım Araçları")
                                .font(.system(size: 30)).fontWeight(.bold)
                                .foregroundStyle(Color.white.opacity(0.7))
                            
                            Button(action: {}, label: {
                                Image(systemName: "chevron.down").font(.system(size: 30)).foregroundStyle(Color("turuncu"))
                            })
                        }//Hstak Bitişi
                    }
                    Spacer(minLength: 0)
                }.padding()
                
                GeometryReader{ gr in
                    ForEach(tasarimAraclari.reversed()){ arac in
                       Kart(arac: arac, gr: gr, suruklendi: $suruklendi, goster: $goster, secildi: $seciliKart, name: name)
                            .offset(x: arac.offset)
                            .rotationEffect(.init(degrees: aciBul(offset: arac.offset)))
                            .gesture(DragGesture().onChanged({ value in
                                //Kart konumunun güncellenmesi
                                if value.translation.width > 0 {
                                    tasarimAraclari[arac.id].offset = value.translation.width
                                }
                            }).onEnded({ value in
                                withAnimation {
                                    if value.translation.width > 150 {
                                        //yeteri kadar sürüklendiyse kartın ekrandan kaybolup son sıraya geçmesi gerekir
                                        tasarimAraclari[arac.id].offset = 1000//Ekranın dışına çıkardık
                                        suruklendi = arac.id + 1
                                        kartDuzelt(id: arac.id)
                                    } else {
                                        //eger yeteri kadar sağ sürüklenmediyse kart tekrar eski konumuna gelmeli
                                        tasarimAraclari[arac.id].offset = 0
                                    }
                                }
                            }))
                    }
                }.offset(y: -30)
                
            }//VStack Bitişi
            .background(LinearGradient(colors: [Color("ust"),Color("merkez"),Color("alt")], startPoint: .top, endPoint: .bottom)).opacity(goster ? 0 : 1)
            if goster{
                Detay(arac: seciliKart, goster: $goster, name: name)
            }
        }//Ztack Bitişi
        
    }
    
    func kartDuzelt(id :Int){//Bu fonksiyon , herhangi bir kartı en arkaya atmak için kullanılır
        var gecerliKart = tasarimAraclari[id]
        //Son Sıraya Ekle
        gecerliKart.id = tasarimAraclari.count
        tasarimAraclari.append(gecerliKart)
        
        //Geriye Efektli Bir Şekilde Göndermek
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
            withAnimation {
                tasarimAraclari[tasarimAraclari.count - 1].offset = 0
            }
        }
        
    }
    
    func aciBul(offset: CGFloat) -> Double {
        let deger = offset / 150
        let aci : CGFloat = 5
        let derece = Double(deger * aci)
        return derece
    }
}

#Preview {
    Home()
}
