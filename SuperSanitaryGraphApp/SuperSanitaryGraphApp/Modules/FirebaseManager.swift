//
//  FirebaseManager.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import Foundation
import FirebaseDatabase


class FirebaseManager {
    
    private var database : DatabaseReference
    private var notificationCenter : NotificationCenter
    
    
    init(){
        self.database = Database.database().reference()
        self.notificationCenter = NotificationCenter.default
        self.listenToValueChange()
        
        
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
    
    func listenToValueChange() {
        database.observe(.value) { [self] (snapshot) in
            guard let dictionary = snapshot.value as? NSDictionary,
                  let color = dictionary["screen_color"] as? String else {return}
            self.notificationCenter.post(name: NSNotification.Name(rawValue: "screenColorChanged"), object: nil, userInfo: ["color":color])
            print(color)
        }
    }
    
    
}
