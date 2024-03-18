//
//  Utilisateur.swift
//  SMARTBUY
//
//  Created by apprenant61 on 22/06/2022.
//

import Foundation
struct Utilisateur : Identifiable{
    var id = UUID()
    var userNom : String = "Santana"
    var userPrénom : String = "Danielo"
    var userMail : String = "DanieloSantana@simplon.com"
    var userPhone : String = "0610032456"
    var userAdress : String = "209 Boulevard Avogadro"
    var userCodePostale : String = "89300, Los Angeles"
    var userVille : String = "Dubai"
    var userPassWord : String = "12345678"
    var date = Date()
    
}


