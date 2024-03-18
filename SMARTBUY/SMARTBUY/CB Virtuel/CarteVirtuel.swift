//
//  CarteVirtuel.swift
//  SMARTBUY
//
//  Created by apprenant61 on 22/06/2022.
//

import SwiftUI

struct CarteVirtuel: View {
    @State private var flou = 0
    @State var montant = ""
    @State var cadena : String = "lock.open.fill"
    @State var intituleTextField = "Montant"
    @State private var lock = false
    @State var oeil = "eye"
    @State var pay = true
    @State var pay2 = true
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    var body: some View {
        
        NavigationView {
            VStack{
                
                
                
                VStack(spacing : 10){
                    Text("Solde Disponible ")
                    
                    Text("3765€")
                        .bold()
                        .font(.system(size: 25))
        
                }.font(.title2)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 350, height: 200)
                        .foregroundColor(.couleurViolet)
                        .shadow(color: .black, radius: 5, x: 3, y: 5)
                    Text("1234 5678 4567 3489")
                        .foregroundColor(.white)
                        .offset(x: -45, y: 50)
                        .blur(radius: CGFloat(flou))
                    Text("VISA")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 25))
                        .offset(x:-110,y:-60)
                    Image(systemName: "wave.3.right")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .offset(x: 110, y: -45)
                    Text("12/24")
                        .foregroundColor(.white)
                        .offset(x: 110, y: 50)
                    Image(systemName: "square.fill")
                        .foregroundColor(.gray.opacity(0.5))
                        .font(.system(size: 45))
                        .offset(x: -110, y: 0)
                }
                
                
                Text("Montant à sécuriser")
                    .font(.headline)
                
                HStack{
                    
                    
                    Button {
                        if cadena == "lock.fill" && montant != "" {
                            lock = true
                        }
                        else if montant.isEmpty{
                            cadena = "lock.open.fill"
                            intituleTextField = "Insérer montant"
                                
                            
                            
                        }
                        else{
                            cadena = "lock.fill"
                            
                        }
                        
                    } label: {
                        Image(systemName: cadena)
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                    }.background(Circle()
                        .frame(width: 65, height: 65)
                        .foregroundColor(.couleurViolet))
                        .shadow(color: .black, radius: 5, x: 3, y: 5)
                    .alert(isPresented: $lock)
                    {
                        
                        Alert(
                            title: Text("Attention"),
                            message: Text("Est-tu sur de vouloir débloquer tes fonds ?"), primaryButton: .cancel(),
                            secondaryButton: .destructive(Text("Débloquer"), action: {
                                cadena = "lock.open.fill"
                            })
                        )
                    }
                    
                    
                    
                    if cadena == "lock.open.fill"{
                        TextField(intituleTextField, text: $montant)
                            .multilineTextAlignment(.center)
                            .frame(width: 125, height: 50)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.couleurViolet))
                            .shadow(color: .black, radius: 5, x: 3, y: 5)
                            .padding()
                            .keyboardType(.decimalPad)
                    
                       
                        
                        
                    }
                    else{
                        Text("\(montant)")
                            .frame(width: 125, height: 50)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.couleurDiagramme))
                            .padding()
                            .keyboardType(.decimalPad)
                    }
              
                }

                List{
                    HStack{
                        Text("Cacher ma carte")
                            .font(.system(size: 20))
                        Spacer()
                        Button {
                            if flou == 0{
                                flou = 5
                                oeil = "eye.slash"
                            }
                            else{
                                flou = 0
                                oeil = "eye"
                            }
                            
                        } label: {
                            Image(systemName: oeil)
                                .foregroundColor(.black)
                        }
                        
                        
                        
                    }.padding(.all,10)
                    HStack{
                        Text(" Paiements à distance")
                            .font(.system(size: 20))
                        Spacer()
                        Toggle( "",isOn: $pay)
                            .toggleStyle(SwitchToggleStyle(tint: .couleurViolet))
                            .frame(width: 75, height: 50)
                    }.padding(.all,2)
                    HStack{
                        Text(" Paiements à l'étranger")
                            .font(.system(size: 20))
                        Spacer()
                        Toggle( "",isOn: $pay2)
                            .toggleStyle(SwitchToggleStyle(tint: .couleurViolet))
                            .frame(width: 75, height: 50)
                    }.padding(.all,2)
                    ListeCB(iconName: "doc", description: "Détails du compte")
                    ListeCB(iconName: "doc.on.doc", description: "Mes documents")
                }.padding(.all,5)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Ma Carte Virtuelle")
            .multilineTextAlignment(.center)
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

struct CarteVirtuel_Previews: PreviewProvider {
    static var previews: some View {
        CarteVirtuel()
    }
}

struct ListeCB: View {
    var iconName : String
    var description : String
    var body: some View {
        HStack{
            Text(description)
                .font(.system(size: 20))
            Spacer()
            Image(systemName: iconName)
                .font(.system(size: 20))
            
            
        }.padding(.all,10)
    }
}
