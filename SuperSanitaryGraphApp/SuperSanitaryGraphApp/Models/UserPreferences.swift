//
//  UserPreferences.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import UIKit

struct userPrefences {
    var screenColor : UIColor
    init?(color: String){
        if color == "red"{
            self.screenColor = UIColor.red
        } else if color == "blue"{
            self.screenColor = UIColor.blue
        } else {
            return nil
        }
    }
}


