//
//  ViewController.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import UIKit

class MainViewController: UITableViewController {
    var selfie : UIImage!
    var user : User!
    var hideButtonsRow : Bool = true
    
    @IBOutlet var nameTextfield : UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        user = User(name:"Daniel")
        self.navigationItem.title = "Hola \(user!.name)"
        self.nameTextfield.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 3:
            let imagePickerVC = UIImagePickerController()
            imagePickerVC.sourceType = .camera
            imagePickerVC.allowsEditing = true
            self.present(imagePickerVC, animated: true, completion: nil)
        default:
            return 
        }
        
    }
    
    @IBAction func retakePhoto(sender: UIButton){
        
    }
    
    @IBAction func seePhoto(sender: UIButton){
        
    }
    
}


extension MainViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image =    info[.editedImage] as? UIImage else {
            return
        }
        self.user.image = image
        
    }
}


extension MainViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: .letters) != nil || string == "" || string == " "{
            return true
        } else {
            return false
        }
    }
}
