//
//  alimentationview.swift
//  smartbuy 2
//
//  Created by apprenant48 on 28/06/2022.
//

import SwiftUI

struct alimentationview: View {
    var body: some View {
        ForEach(alimentation){
            valeur in Affichage(affiché: valeur)    }
}

struct alimentationview_Previews: PreviewProvider {
    static var previews: some View {
        alimentationview()
    }
}
}
