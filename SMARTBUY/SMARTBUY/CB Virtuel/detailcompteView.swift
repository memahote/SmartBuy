//
//  detailcompteView.swift
//  SMARTBUY
//
//  Created by apprenant60 on 22/06/2022.
//

import SwiftUI

struct detailcompteView: View {
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                Text("Mon Compte")
                    .font(.title)
                    
                Text("Nom prenom")
                    .font(.headline)
                   
                Text("Identifiant : 1234")
                    .font(.headline)
                    
            }.padding(.trailing,200)
            List{
                VStack(alignment: .leading){
                    Text("Téléphone Mobile :")
                        .font(.title2)
                    Text("0612345678")
                        .font(.title3)
                }
                VStack(alignment: .leading){
                    Text("Adresse e-mail :")
                        .font(.title2)
                    Text("danieloSantana@dobrazil.br")
                        .font(.title3)
                }
                VStack(alignment: .leading){
                    Text("Mot de passe :")
                        .font(.title2)
                    Text("*******65t")
                        .font(.title3)
                }
                VStack(alignment: .leading){
                    Text("Adresse postale")
                        .font(.title2)
                    Text("13 calle del sol, Brasilia ")
                        .font(.title3)
                }
            }
            
        }
    }
}

struct detailcompteView_Previews: PreviewProvider {
    static var previews: some View {
        detailcompteView()
    }
}
