//
//  depenseview.swift
//  smartbuy 2
//
//  Created by apprenant48 on 28/06/2022.
//

import SwiftUI

struct DepensesView: View {
    
    @State private var activity : Int = 0
    
    var body: some View {
        
        NavigationView {
        
            ZStack {
                
                VStack{
                
                Picker(selection: $activity, label: Text("filtrage a selectioné")) {
                    Text("Derniers paiments ").tag(0)
                    Text("Transport").tag(1)
                    Text("alimentation").tag(2)
                    Text("Logement").tag(3)
                    Text("Loisir").tag(4)
                    Text("Banquaire").tag(5)
                }
                   
                    
                    if activity == 0 {
                        Données()
                    } else if  activity == 1 {
                        transportview()
                    }
                    else if  activity == 2 {
                        alimentationview()
                    }
                    
                    else if  activity == 3 {
                        logementview()
                    }
                    else if  activity == 4 {
                        loisirview()
                    }
                    else if  activity == 5 {
                        banquairview()
                        
                    }
                else {
                    Text("erreur")
                }
                    
                
                    
                    Spacer()
                
                    
                    } // end vstack
                    
      
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Mes Dépenses")
                            .toolbar(content: {

                                ToolbarItem(placement: .navigationBarTrailing) {
                                    NavigationLink {
                                        ProfilView()
                                    } label: {
                                        Image(systemName: "person")
                                    }

                                }
                            })
            }

        }
        
        
        
 
}
}


struct Depenses_Previews: PreviewProvider {
    static var previews: some View {
        DepensesView()
    }
}

struct aff: View {
    var nomSymb : String
    var nomSymb2 : String
    var nomSymb3 : String
    var nomSymb4 : String
    var nomSymb5 : String
    var nomSymb6 : String
    
    var body: some View {
        HStack{
            
            Image(systemName: nomSymb)
                .font(.system(size: 40))
            Image(systemName: nomSymb2)
                .font(.system(size: 40))
            Image(systemName: nomSymb3)
                .font(.system(size: 40))
            Image(systemName: nomSymb4)
                .font(.system(size: 40))
            Image(systemName: nomSymb5)
                .font(.system(size: 40))
            Image(systemName: nomSymb6)
                .font(.system(size: 40))
            
        }
    }
}


struct Affichage : View {
    
    var affiché: DonneesDepenseUtilView
    
    var body: some View{
        
        HStack{
           
                Image(systemName: affiché.nomSymb)
                    .font(.title)
                Text(affiché.description)
                    .font(.system(size: 20))
                    .padding()
            
            Spacer()
           
                Text(affiché.prix)
                    .foregroundColor(.red)
                
                Text(affiché.date)
          
            
        }//.font(.body)
        
    }
    
}


    
    let transport = [ DonneesDepenseUtilView(nomSymb:"car", description: "péage st-etienne", prix: "-22€", date: "21/05"),
                      DonneesDepenseUtilView(nomSymb: "car", description: "station essence", prix:"-60€", date: "17/05"),
                      
                      DonneesDepenseUtilView(nomSymb: "car", description: "garage Louis", prix:"-80€", date: "20/05"),
                      DonneesDepenseUtilView(nomSymb: "car", description: "Michelin service", prix:"-200€", date: "20/05"),
                      
    ]
    
    let alimentation = [ DonneesDepenseUtilView(nomSymb: "cart", description: "carrefour écully", prix: "-22€", date: "20/05")
                         
    ]
    
    let maison = [ DonneesDepenseUtilView(nomSymb: "house", description: "taxe d'habitation", prix: "-220€", date: "19/05")
    ]
    
    let loisir = [ DonneesDepenseUtilView(nomSymb: "leaf", description: "parc coursieux", prix: "33,42€", date: "18/05")]
    
    let banque = [ DonneesDepenseUtilView(nomSymb: "creditcard", description: "retrait distrib", prix: "-30€", date: "18/05")
                   
    ]

struct Données : View {
    
    var body: some View {
        
        List{
            ForEach(transport) { valeur in
                
                Affichage(affiché: valeur)
            }
                ForEach(alimentation){
                    valeur in Affichage(affiché: valeur)
                    ForEach(maison){
                        valeur in Affichage(affiché: valeur)
                        ForEach(loisir){
                            valeur in Affichage(affiché: valeur)
                            ForEach (banque){
                                valeur in Affichage(affiché: valeur)

                            }


                        }
                    }
                }
            }

        }
    
}
        



