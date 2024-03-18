//
//  loisirview.swift
//  smartbuy 2
//
//  Created by apprenant48 on 28/06/2022.
//

import SwiftUI

struct loisirview: View {
    var body: some View {
        ForEach(loisir){
            valeur in Affichage(affiché: valeur)
            
        }
    }    }


struct loisirview_Previews: PreviewProvider {
    static var previews: some View {
        loisirview()
    }
}
