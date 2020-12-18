//
//  ImageShowViewController.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 18/12/20.
//

import UIKit

class ImageShowViewController: UIViewController {
    @IBOutlet var imageView : UIImageView!
    
    var image : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = image
        
    }
    

}
