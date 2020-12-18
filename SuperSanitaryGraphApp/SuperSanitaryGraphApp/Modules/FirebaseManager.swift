//
//  FirebaseManager.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import Foundation
import FirebaseDatabase


class FirebaseManager {
    
    var database : DatabaseReference
    
    
    init(){
        self.database = Database.database().reference()
        
    }
    
    func returnScreenColor( completionhandler: @escaping (String) -> Void){
        database.observeSingleEvent(of: .value, with: {(snapshot) in
            
            print(snapshot)
            guard let dictionary = snapshot.value as? NSDictionary,
                  let color = dictionary["screen_color"] as? String else {return}
            print(color)
            completionhandler(color)
            
        }) {(error) in
            print(error)
        }
        
    }
    
    
}
