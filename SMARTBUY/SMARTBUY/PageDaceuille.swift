//
//  PageDaceuille.swift
//  SMARTBUY
//
//  Created by apprenant61 on 22/06/2022.
//
import AVKit
import SwiftUI

struct PageDaceuille: View {
    @AppStorage("conseil") var conseil : String = "Pensez à consulter votre compte souvent! "
    
    @AppStorage("favoris") var favoris : String = "conseil de la semaine"
    @AppStorage("ajFavoris") var ajouterFavoris : String = "Ajouter favoris"
   
    @State var isPresented = true
    @State var Couleurs : Color = .black
   
    
    let url = URL(string: "https://www.youtube.com/watch?v=QV4_kVIf4V4")!

 
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical){
        VStack{
            ZStack{
               
                Image("Cercle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text("800 €")
                    .font(.title)
            }
        
            
            Text("Budget Du Mois")
                .font(.title2)
         
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 50)
                    .foregroundColor(.couleurViolet)
                
                Text("1800 €")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            HStack{
              RoundedRectangle(cornerRadius: 10)
                    .frame(width: 80, height: 2)
            Text("Conseil de la semaine")
                    
                .foregroundColor(.black)
                .bold()
                RoundedRectangle(cornerRadius: 10)
                      .frame(width: 80, height: 2)
                
            }
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 250, height: 100)
                    .foregroundColor(.couleurViolet.opacity(0.8)).background(RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.couleurSaumon)
                        .frame(width: 250, height: 100))
                HStack{
                    ZStack{
                Text(conseil)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 100)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.couleurSaumon)
                        .frame(width: 250, height: 100))
                    
                    
                    
                    Button{
                     conseil = "Pensez à regarder votre compte "
                        if favoris != conseil {
                            favoris = conseil
                            Couleurs = .red
                        }else if favoris == conseil{
                            favoris = ajouterFavoris
                            Couleurs = .black
                        }
                        
                    }label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(Couleurs)
                    }.offset(x: 100, y: 0)
                    }

                }
            }
            HStack{
                RoundedRectangle(cornerRadius: 10)
                      .frame(width: 135, height: 2)
            Text("Conseils")
                    .bold()
                RoundedRectangle(cornerRadius: 10)
                      .frame(width: 135, height: 2)
            }
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 250, height: 100)
                            .foregroundColor(.couleurViolet.opacity(0.8))
                        Text("Règle de 50%(charge principale), 30%(économie/investissement), 20% (plaisir)")
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 100)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.couleurSaumon)
                                .frame(width: 250, height: 100))
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 250, height: 100)
                            .foregroundColor(.couleurViolet.opacity(0.8))
                        Text("Fixez vous des objectifs, et regarder votre progression")
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 100)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.couleurSaumon)
                                .frame(width: 250, height: 100))
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 250, height: 100)
                            .foregroundColor(.couleurViolet.opacity(0.8))
                        Text("N'oubliez pas de vous faire plaisir")
                            .multilineTextAlignment(.center)
                            .frame(width: 200, height: 100)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.couleurSaumon)
                                .frame(width: 250, height: 100))
                    }
                    
                }
            }
            HStack{
                RoundedRectangle(cornerRadius: 10)
                      .frame(width: 140, height: 2)
            Text("Video")
                    .bold()
                RoundedRectangle(cornerRadius: 10)
                      .frame(width: 140, height: 2)
                    
            }
                
            ScrollView(.horizontal){
                HStack{
                    ZStack{
                    Rectangle()
                        .frame(width: 220, height: 120)
                        .foregroundColor(.couleurViolet.opacity(0.8))
                        .border(Color.couleurSaumon, width: 3)
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(width: 200, height: 100)
                    }
                    ZStack{
                    Rectangle()
                        .frame(width: 220, height: 120)
                        .foregroundColor(.couleurViolet.opacity(0.8))
                        .border(Color.couleurSaumon, width: 3)
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(width: 200, height: 100)
                    }
                }
                
            
            
            
            }.padding(.top, 0)
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 100, height: 50)
        }.toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    ProfilView()
                } label: {
                    Image(systemName: "person")
                }

            }
        })

            }
            
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Danielo Santana")

        }.fullScreenCover(isPresented: $isPresented) {
            Bienvenu(isShowing: $isPresented)
        
        
        }
    }
}

struct PageDaceuille_Previews: PreviewProvider {
    static var previews: some View {
        PageDaceuille()
    }
}


