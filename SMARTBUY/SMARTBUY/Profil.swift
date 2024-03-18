//
//  Profil.swift
//  SMARTBUY
//
//  Created by apprenant61 on 22/06/2022.
//

import SwiftUI

struct ProfilView: View {

    var body: some View {
        
        ScrollView() {
            
            VStack(spacing: 15){
            HStack {
                ZStack{
                    Circle()
                        .frame(width: 220, height: 220)
                        .foregroundColor(.couleurSaumon)
                        .offset(x: 23)
                Image("Profil")
                    .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200.0, height: 200.0, alignment: .center)
                        .clipShape(Circle())
                        .offset(x: 23)
                }

                
                Image(systemName: "gearshape.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30.0, height: 30, alignment: .top)
                    .offset(x: 40, y: -75)
                
            }
            
            
                HStack (spacing: 40){
                    ZStack (alignment: .leading){
                    Rectangle()
                        .frame(width: 250, height: 30)
                        .border(Color.couleurViolet)
                    .foregroundColor(Color.white)
                    
                    Rectangle()
                        .frame(width: 150, height: 30)
                        .foregroundColor(Color.couleurViolet)
                    }
                    
                    Text("1")
                        
                        .background(Circle()
                                .strokeBorder()
                                .aspectRatio(1, contentMode: .fill))
                        .foregroundColor(.couleurDiagramme)
                        .font(.system(size: 30))

                }
            }
        
                                     
            
            
            VStack(spacing: 35){
                
                ExtractedBarreTitreView(barreTitreText : "Projets Accomplis")

                ListeDonneesProj()
                
                
                ExtractedBarreTitreView(barreTitreText : "Conseils Favoris")
                
                ListeDonneesConseilsFav()
                
            }
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 100, height: 70)
                .padding()

                        }
                            
                    }
                    
    
            }

                                             



struct ExtractedBarreTitreView: View {
    var barreTitreText : String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: .infinity, height: 60)
                .foregroundColor(Color.couleurViolet)
            Text(barreTitreText)
                .font(.system(size: 25))
                .foregroundColor(.white)
            
            
        }
    }
}




struct DonneesProjAcc: Identifiable {
    var id = UUID()
    var projetEntrepText: String //A CHANGER AVEC LES DONNEES DE MOUNIR
}


struct DonneesProjAccView : View {
    var donProj: DonneesProjAcc
    
    var body: some View{
        HStack (spacing : 10){
                ZStack{
                    Rectangle()
                        .frame(width: 270, height: 50)
                        .cornerRadius(10)
                        .foregroundColor(Color.couleurViolet)
                    Text(donProj.projetEntrepText)
                    //POTENTIELLE CHANGEMENT POUR QUE LE RECT SUIVENT LE TEXTE
                    
                }
                Image(systemName: "checkmark.square")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
            }
        }

    }


struct ListeDonneesProj : View {
    let listeDonneesPA = [
    DonneesProjAcc(projetEntrepText: "Nouvelle Voiture"),
    DonneesProjAcc(projetEntrepText: "Voyage"),
    DonneesProjAcc(projetEntrepText: "Remplacer la clim")
 ]
    
    
    var body: some View {
        VStack (spacing: 20){
            ForEach(listeDonneesPA) {projet in
                DonneesProjAccView(donProj: projet)
            }
        }
        
    }
}






struct DonneesConseilsFav: Identifiable {
    var id = UUID()

    @State var favori = UserDefaults.standard.string(forKey: "conseil") ?? ""
    @State var ajouterFav = UserDefaults.standard.string(forKey: "ajFavoris") ?? ""
    @State var conseilSemaine = UserDefaults.standard.string(forKey: "favoris") ?? ""
    @State var Couleurs : Color = .yellow
    @State var coulRectUn: Color = .couleurViolet

}


struct DonneesConseilsFavView : View {
    var jePigeQueDalle : DonneesConseilsFav
    
    @State var favori = UserDefaults.standard.string(forKey: "conseil") ?? ""
    @State var ajouterFav = UserDefaults.standard.string(forKey: "ajFavoris") ?? ""
    @State var conseilSemaine = UserDefaults.standard.string(forKey: "favoris") ?? ""
    
   
    @State var Couleurs : Color = .red
    @State var coulRectUn: Color = .couleurViolet
    
    var body: some View{
            HStack (alignment: .center, spacing: 20) {
                ZStack{
                    Rectangle()
                        .frame(width: 290, height: 50)
                        .cornerRadius(10)
                        .foregroundColor(coulRectUn)
                        .layoutPriority(1)
                    
                    HStack {
                        Text(favori)
                        .frame(width: 200)
                        .multilineTextAlignment(.center
                        )
                        Button{

                            if favori == conseilSemaine{

                                favori = ajouterFav
                                Couleurs = .white
                                coulRectUn = .white
                            }


                        }label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Couleurs)
                        }
                        
                    }
                    
                }
                
            }
        }

    }


  struct ListeDonneesConseilsFav : View {
    let listeDonneesCF = [
        
        DonneesConseilsFav()
        
 ]
    
    
   var body: some View {
        VStack(spacing: 30){
            ForEach(listeDonneesCF) {conseil in
                DonneesConseilsFavView(jePigeQueDalle : conseil)
                
            }
        }
        
    }
}



struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

