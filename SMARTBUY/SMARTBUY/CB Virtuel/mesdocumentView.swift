//
//  mesdocumentView.swift
//  SMARTBUY
//
//  Created by apprenant60 on 22/06/2022.
//

import SwiftUI

struct mesdocumentView: View {
            @State private var vstacks = 0
            
            var body: some View {
                    Button(action: { vstacks += 1 } ) {
                        Image(systemName: "plus.circle.fill").foregroundColor(.black)
                    }
                    ForEach(0..<vstacks, id: \.self) { vs in
                        VStack{
                            Text("hello vstack: \(vs) here")
                        }
                    }
        
        }
        
}







struct mesdocumentView_Previews: PreviewProvider {
    static var previews: some View {
        mesdocumentView()
    }
}
