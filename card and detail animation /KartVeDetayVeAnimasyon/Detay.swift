//
//  Detay.swift
//  KartVeDetayVeAnimasyon
//
//  Created by Yaşar Duman on 19.09.2023.
//

import SwiftUI

struct Detay: View {
    var arac : Araclar
    @Binding var goster : Bool//Eger true ise zaten görüntüleniyordur . fakat false yapacaksak artık ekranda bu detay sayfasını tutmamamız gerekiyor
    var name : Namespace.ID
    
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12){
                Button(action: {withAnimation(.spring()){ goster.toggle() }}, label: {
                    Image(systemName: "chevron.left").font(.system(size: 30, weight: .bold))
                        .foregroundStyle(.black)
                })
                Spacer()
                
                Image(arac.goruntuAdi).matchedGeometryEffect(id: arac.goruntuAdi, in: name)
                
            }.padding(.leading, 20)
             .padding([.top, .trailing])
            
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    HStack{
                        VStack(alignment: .leading, spacing: 12){
                            Text(arac.aracAdi).font(.system(size: 45, weight: .bold)).foregroundStyle(Color.black)
                            
                            Text("Tasarım Araçları").font(.system(size: 30)).foregroundStyle(.black).lineLimit(1)
                            
                            Text("Ucretsiz").font(.title).fontWeight(.bold).foregroundStyle(.blue).padding(.top)
                            
                            
                        }
                        Spacer(minLength: 0)
                        
                        HStack{
                            Text("#").font(.system(size: 60, weight:  .bold))
                            Text("\(arac.sira)").font(.system(size: UIScreen.main.bounds.height < 750 ? 150 : 180, weight: .bold))
                        }.foregroundStyle(Color.gray.opacity(0.7))
                    }//Hstack Bitişi
                    
                    Text("\(arac.aracAdi) özellikle dijital tasarım ve arayüz tasarımı için yapılmış olup, mobil ve web tasarımcıları için mükemmel bir seçimdir. Şu an Apple, Facebook, Dropbox, Twitter ve bunlar gibi bir çok şirketin kendi uygulamarını tasarlamak için kullandığı bir UI/UX tasarım programıdır.")
                        .font(.system(size: 20))
                        .foregroundStyle(Color.black.opacity(0.7))
                        .multilineTextAlignment(.leading)
                        
                    
                    HStack(spacing: 15){
                        Button(action: {}, label: {
                            Text("Web Adresi").fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 120)
                                .background(Color("turuncu"))
                                .clipShape(Capsule())
                        })
                        Button(action: {}, label: {
                            Image(systemName: "suit.heart.fill")
                                .font(.title)
                                .foregroundStyle(Color("turuncu"))
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 3)
                        })
                    }.padding(.top, 25).padding(.bottom)
                    
                }.padding(.horizontal, 20)//VStack Bitişi
            }//ScrollView Bitişi
            
        }.background(Color.white) //VStack Bitişi
    }
}

