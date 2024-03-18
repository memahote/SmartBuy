//
//  EnumDepenses.swift
//  SMARTBUY
//
//  Created by apprenant61 on 22/06/2022.
//

import Foundation
struct categorieDepenses : Identifiable{
    var id = UUID()
    var depensesTransports : Int
    var depensesAlimentaire : Int
    var depensesCredit : Int
    var depensesMaison: Int
    var depensesLoisirs : Int
    
}
