//
//  User.swift
//  IntroObservableObjects (iOS)
//
//  Created by apprenant56 on 28/06/2022.
//

import Foundation

class Projet : Identifiable, ObservableObject {
    
    internal init() {
        self.tableauProjet = []
        self.tableauSecondaire = []
    }
    
    

    var id = UUID()
    @Published var tableauProjet : [Project]
    @Published var tableauSecondaire : [Project]
    
   // @Published var loisirs :  [String]
    
    func addprojet(Name: String,Goal : Int) {
        
        self.tableauProjet.append(Project(projectName: Name, projectGoal: Goal))
        
    }
    
    func addprojetsecond(Name: String, Goal : Int){


        self.tableauSecondaire.append(Project(projectName: Name, projectGoal: Goal))
    }
    
    
    struct Project : Identifiable{
        var id = UUID()
        var projectName : String
        var projectGoal : Int
    }

 
}



