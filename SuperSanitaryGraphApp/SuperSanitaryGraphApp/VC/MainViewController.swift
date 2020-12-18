//
//  ViewController.swift
//  SuperSanitaryGraphApp
//
//  Created by L Daniel De San Pedro on 17/12/20.
//

import UIKit

class MainViewController: UITableViewController {
    private var selfie : UIImage!
    private var user : User!
    private var hideButtonsRow : Bool = true
    private let notificationCenter = NotificationCenter.default
    private lazy var tapGestureRecognizer : UITapGestureRecognizer = {
        return UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    }()
    
    @IBOutlet var nameTextfield : UITextField!
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        user = User(name:"Daniel")
        self.navigationItem.title = "Hola \(user!.name)"
        self.nameTextfield.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        notificationCenter.addObserver(self, selector: #selector(changeColor(sender:)), name: NSNotification.Name("screenColorChanged"), object: nil)
        notificationCenter.addObserver(self, selector: #selector(configureKeyboardInteraction), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(removeKeyboardGestureRecognizer), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.notificationCenter.removeObserver(self)
        
        view.removeGestureRecognizer(self.tapGestureRecognizer)
        
        
        self.view.endEditing(true)
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap")
        switch indexPath.row {
        case 1:
            let imagePickerVC = UIImagePickerController()
            imagePickerVC.sourceType = .camera
            imagePickerVC.allowsEditing = true
            self.present(imagePickerVC, animated: true, completion: nil)
        case 2:
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "GraphTableViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            return 
        }
        
    }
    
    @IBAction func retakePhoto(sender: UIButton){
        
    }
    
    @IBAction func seePhoto(sender: UIButton){
        
    }
    @objc func changeColor(sender: NSNotification){
        guard let info = sender.userInfo,
              let hexColor = info["color"] as? String else {return}
        let color = UIColor(hex: hexColor)
        self.view.backgroundColor = color
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}


extension MainViewController {
    @objc private func configureKeyboardInteraction() {
        
        view.addGestureRecognizer(self.tapGestureRecognizer)
        
    }
    @objc private func removeKeyboardGestureRecognizer() {
        view.removeGestureRecognizer(self.tapGestureRecognizer)
        
    }

    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
}
