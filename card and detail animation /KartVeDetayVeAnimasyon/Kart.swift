//
//  Kart.swift
//  KartVeDetayVeAnimasyon
//
//  Created by Yaşar Duman on 19.09.2023.
//

import SwiftUI

struct Kart: View {
    var arac : Araclar
    var gr : GeometryProxy
    
    @Binding var suruklendi : Int
    @Binding var goster : Bool 
    @Binding var secildi : Araclar
    var name : Namespace.ID
    var body: some View {
        VStack{
            Spacer(minLength: 0)
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                VStack(alignment: .leading, spacing: 12){
                    Image("\(arac.goruntuAdi)").resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.top)
                        .padding(.horizontal, 25)
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 12){
                            Text(arac.aracAdi).font(.system(size: 40)).fontWeight(.bold)
                            Text("Tasarım Aracı").font(.system(size: 20)).foregroundStyle(Color.black)
                            
                            Button(action: {
                                withAnimation(.spring()) {
                                    secildi = arac // detayları gösterilecek olan kart secildi
                                    goster.toggle()// Detayların bu kart için gösterilmesi gerektigini belirtiyoruz
                                     
                                }
                            }, label: {
                                Text("Daha Fazla Bilgi >").font(.system(size: 20)).foregroundStyle(Color("turuncu"))
                            }).padding(.top)
                        }
                    }.padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        .padding(.top, 25)
                    
                }//Vstack Bitişi
                
                HStack{
                    Text("#").font(.system(size: 60)).fontWeight(.bold).foregroundStyle(Color.gray.opacity(0.6))
                    Text("\(arac.sira)") . font(.system(size: UIScreen.main.bounds.height < 700 ? 100 : 120))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.gray.opacity(0.6))
                }.offset(x: -15, y: UIScreen.main.bounds.height < 750 ? 5 : 25)
                
            }.frame(height: gr.frame(in: .global).height - 120)
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(25)
                .padding(.horizontal, 30 + (CGFloat(arac.id - suruklendi) * 20))
                .offset(y: arac.id - suruklendi <= 2 ? CGFloat(arac.id - suruklendi) * 25 : 50)
                .shadow(color: Color.black.opacity(0.12), radius: 5, x: 0, y: 5)
            Spacer(minLength: 0)
        }.contentShape(Rectangle())
    }
}

