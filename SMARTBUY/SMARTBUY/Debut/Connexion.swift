//
//  Connexion.swift
//  SMARTBUY
//
//  Created by apprenant61 on 22/06/2022.
//

import SwiftUI

struct Connexion: View {
    @State var navigationOn : Bool = false
    @State var UserLogin : String = ""
    @State var UserPassword : String = ""
    @State var MonLogin : String = "DanieloSantana"
    @State var MonPassWord : String = "12345678"
    @State var textDeConnexion : String = "Veuillez vous entrez votre identifiant et votre mots de passe."
    @Binding var isShowing: Bool
    @State  var pSHiden : Bool = true
    @State var eye = "eye.fill"
    var body: some View {
        ZStack{
        RoundedRectangle(cornerRadius: 50)
            .strokeBorder(Color.couleurViolet,lineWidth: 10)
            .ignoresSafeArea()
        VStack{
            
            VStack(spacing : -35){
            Image("logo-1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Image("smartbuy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 50)
            }.padding(.bottom)
            Text("Identifiant de connexion")
            
            TextField("...", text: $UserLogin)
                .padding()
                .foregroundColor(.white)
                .background(Color.couleurViolet).cornerRadius(10)
                .font(.headline)
            
            
            Text("Mots de passe")
            ZStack{
                Group{
                if pSHiden{
                    SecureField("...", text: $UserPassword)
                }else{
                    TextField("...", text: $UserPassword)
                }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.couleurViolet).cornerRadius(10)
                .font(.headline)
                Button {
                    pSHiden.toggle()
                } label: {
                    Image(systemName: self.pSHiden ? "eye.slash.fill" : "eye.fill" )
                        .foregroundColor(.white)
                }
                .padding(.leading, 300)

                

            }
                
            Spacer()
            HStack{
            Text(textDeConnexion)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom)
            
            NavigationLink(isActive: $navigationOn){
                PageDaceuille()
            }label:{
                EmptyView()}
            Button(action: {
                if( UserLogin == MonLogin && UserPassword == MonPassWord){  navigationOn = true
                    isShowing.toggle()
                }
                
                else{
                    textDeConnexion = "Identifiant ou mots de passe incorect"
                }
            } , label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 200, height: 50)
                    Text("Connnexion")
                        .foregroundColor(.white)
                }
            })
            .foregroundColor(.couleurViolet)
            Spacer()
        
    
                           
                           }
                .padding()
                           }
    }
                           }
                           
                           struct Connexion_Previews: PreviewProvider {
                static var previews: some View {
                    Connexion(isShowing: .constant(false) )
                }
            }
