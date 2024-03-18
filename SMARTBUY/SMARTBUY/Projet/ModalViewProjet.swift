//
//  EditionView.swift
//  IntroObservableObjects (iOS)
//
//  Created by apprenant56 on 28/06/2022.
//

import SwiftUI

struct ModalViewProjet: View {
    var Tab : Projet
    @Binding var isShowing: Bool
    @State var nomprojet : String = ""
    @State var montantprojet : Int = 0
    var body: some View {
        
        ZStack {
            if isShowing {
                Color.couleurDiagramme
                       
                    VStack{
                        Text("Nouveau Projet")
                            .font(.title)
                            .foregroundColor(.white)
                        TextField("Nom du nouveau projet",text : $nomprojet )
                            .background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.gray.opacity(0.3))
                                .frame(width: 380, height: 50))
                            .padding()
                        TextField("Montant à atteindre" , value : $montantprojet, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.gray.opacity(0.3))
                                .frame(width: 380, height: 50))
                            .padding()
                        
                        Button {
                            isShowing = false
                            Tab.addprojet(Name: nomprojet , Goal : montantprojet)
                            
                        } label: {
                            Text("Ajouter le projet")
                        } .foregroundColor(.couleurSaumon)
                            .background(RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 50, alignment: .center)
                                .foregroundColor(.white))
                            .padding()
                      
                    }
                    .frame(height: 400)
                    .frame( maxWidth: .infinity)
                    .background(Color.couleurDiagramme)
                    .ignoresSafeArea()
                    .foregroundColor(.white)
               
                
            }
        
       
        }.frame(maxWidth : .infinity , maxHeight: .infinity)
            .ignoresSafeArea()
            .animation(.easeInOut, value:isShowing)
    }
}

struct Project : Identifiable{
    var id = UUID()
    var projectName : String
    var projectGoal : Int
}

struct Projets : View {
    @State var nomprojet : String = ""
    @State var prixprojet : Int = 0
    var body: some View{
        VStack{
        HStack{
            Text(nomprojet)
            Spacer()
            VStack{
                Image(systemName: "chart.pie")
                    .font(.system(size: 60))
                Text("\(prixprojet)€")
            }
        }.padding()
        .background(RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.gray.opacity(0.3)))
        .foregroundColor(.cyan)
    
    }
    
}
}


struct ModalViewProjet_Previews: PreviewProvider {
    static var previews: some View {
       ProjetView()
    }
}
