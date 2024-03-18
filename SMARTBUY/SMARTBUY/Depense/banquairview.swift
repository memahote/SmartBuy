//
//  banquairview.swift
//  smartbuy 2
//
//  Created by apprenant48 on 28/06/2022.
//

import SwiftUI

struct banquairview: View {
    var body: some View {
        ForEach(banque){
            valeur in Affichage(affiché: valeur)
            
        }
    }    
}

struct banquairview_Previews: PreviewProvider {
    static var previews: some View {
        banquairview()
    }
}
