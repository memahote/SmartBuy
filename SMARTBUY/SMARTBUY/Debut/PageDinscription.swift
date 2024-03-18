//
//  PageDinscription.swift
//  SMARTBUY
//
//  Created by Le_Sioud@ on 27/06/2022.
//

import SwiftUI

struct PageDinscription: View {
    @State private var userNom : String = "Danielo"
    @State private var userPrénom : String = "Santana"
    @State private var userMail : String = "DanieloSantana@simplon.com"
    @State private var userPhone : String = "0753678293"
    @State private var userAdress : String = "3 Rue simplon"
    @State private var userCodePostale : String = "69100"
    @State private var userVille : String = "Villeurbanne"
    @State private var userPassWord = 0
    @State private var date = Date()
    @Binding var isShowing: Bool
    
    var body: some View {

        NavigationView {
            Form {
                Section("Nom") {
                    TextField("Danielo", text: $userNom)
                }
                Section("Prénom") {
                    TextField("Santana", text: $userPrénom)
                }
                DatePicker(
                "Date de naissance  :" ,
                selection: $date,
                displayedComponents: [.date])
                Section("Email") {
                    TextField("Nom.prenom@gmail.com", text: $userMail)
                }
                Section("Numéro de télephone") {
                    TextField("+33 0123456789", text: $userPhone)
                }
                Section("adresse") {
                    TextField("3 rue SmartBuy", text: $userAdress)
                }
                Section("Code postale") {
                    TextField("69100", text: $userCodePostale)
                }
                Section("Ville") {
                    TextField("Villeurbanne", text: $userVille)
                }
                Section("code secret") {
                    TextField("012345678", value: $userPassWord, formatter: NumberFormatter())
                }
                
            }
            .navigationTitle("Inscription")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button{
                        isShowing.toggle()
                        

                    }label: {
                       Text("Valider")

                    }
                }
            }
        }.navigationBarHidden(true)
    }
}

    


struct PageDinscription_Previews: PreviewProvider {
    static var previews: some View {
        PageDinscription(isShowing: .constant(false))
    }
}
