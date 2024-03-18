//
//  transportview.swift
//  smartbuy 2
//
//  Created by apprenant48 on 28/06/2022.
//

import SwiftUI

struct transportview: View {
    var body: some View {
        
        List{
            ForEach(transport) { valeur in
                
                Affichage(affiché: valeur)
                
            }
        }
    }
}
    struct transportview_Previews: PreviewProvider {
        static var previews: some View {
            transportview()
        }
    }

