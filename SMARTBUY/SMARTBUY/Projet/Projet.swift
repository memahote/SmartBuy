//
//  ContentView.swift
//  Shared
//
//  Created by apprenant56 on 28/06/2022.
//

import SwiftUI

struct ProjetView: View {
    
    @ObservedObject var Tab : Projet = Projet()
    @ObservedObject var Tab2 : Projet = Projet()
    @State private var isShowing = false
    
    var body: some View {
        
        NavigationView {
            VStack{
            ZStack {
                VStack{
                    //nav view
            
                    List{
                        Section( header : HStack {
                            
                        Text("Ajouter un projet")
                                .font(.system(size: 20))
                                .bold()
                                
                               Spacer()
                               Button {
                                   
                                   isShowing = true
                               } label: {
                                   Image(systemName: "plus.app")
                               }.padding()
                                .font(.largeTitle)
                               
                           }
                            .foregroundColor(.white)
                            .background(Rectangle()
                                .frame(width: 400, height: 75)
                                .foregroundColor(.couleurViolet)
                                )
                        
                                 ){
                        
                            HStack{
                                    Text("Projet 1")
                                        .font(.system(size: 25))
                                    Spacer()
                                    VStack{
                                        Image(systemName: "chart.pie")
                                            .font(.system(size: 50))
                                        Text("1500")
                                            .font(.system(size: 25))
                                    }
                                }.padding()
                            HStack{
                                    Text("Projet 2")
                                        .font(.system(size: 25))
                                    Spacer()
                                    VStack{
                                        Image(systemName: "chart.pie")
                                            .font(.system(size: 50))
                                        Text("4567")
                                            .font(.system(size: 25))
                                    }
                                }.padding()
                            ForEach(Tab.tableauProjet){ objectif in
                        
                    HStack{
                            Text(objectif.projectName)
                                .font(.system(size: 25))
                            Spacer()
                            VStack{
                                Image(systemName: "chart.pie")
                                    .font(.system(size: 50))
                                Text("\(objectif.projectGoal)")
                                    .font(.system(size: 25))
                            }
                        }.padding()
                    }
                }
                    /*Section ( header :HStack{
                 Text("Secondaire")
                        Spacer()
                        Button {
                            showModal2 = true
                        } label: {
                            Image(systemName: "plus.app")
                                .padding()
                                .font(.largeTitle)
                        }

                        
                        
                    }.padding()
                        .foregroundColor(.white)
                        .font(.title)
                        .background(Rectangle()
                            .frame(width: 400, height: 75)
                            .foregroundColor(.indigo)
                            .border(Color.indigo.opacity(0.3), width: 3)))
                        {
                                
                            }*/
                    
                    }
                    
                }
             //   ModalViewProjet(Tab: Tab,isShowing: $showModal)
            }
            }
            .sheet(isPresented: $isShowing, content: {
                ModalViewProjet(Tab: Tab, isShowing: $isShowing)
            })
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Mes Projets")
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



    

struct ProjetView_Previews: PreviewProvider {
    static var previews: some View {
        ProjetView()
    }
}
