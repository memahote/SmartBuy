//
//  ContentView.swift
//  SMARTBUY
//
//  Created by apprenant61 on 22/06/2022.
//

import SwiftUI

struct Bienvenu: View {
    @Binding var isShowing: Bool
    
    var body: some View {
    NavigationView{
        VStack{
        ZStack{
            RoundedRectangle(cornerRadius: 50)
                .strokeBorder(Color.couleurViolet,lineWidth: 10)
                .ignoresSafeArea()
                
            VStack{
        
        Image("portfeuille")
                .resizable()
                .scaledToFit()
                .offset(x: 0, y: -175)
                
                
                VStack{
                    Text("Bienvenue sur")
                        .font(.largeTitle)
                        
                    Image("smartbuy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 50)
                        
                }.offset(x: 0, y: -200)
                
            }
          
            VStack{
            NavigationLink(destination: PageDinscription(isShowing: $isShowing),label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.couleurViolet)
                    Text("Inscription")
                        .foregroundColor(.white)
                }
            })
            
            
            NavigationLink(destination: Connexion( isShowing: $isShowing), label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.couleurViolet)
                    Text("Connexion")
                        .foregroundColor(.white)
                }
            })
            }.offset(x: 0, y: 200)
            
            

                
            
        }
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Bienvenu(isShowing: .constant(false))
    }
}
