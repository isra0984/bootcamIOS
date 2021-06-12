//
//  ViewController.swift
//  UIComponents
//
//  Created by Israel Torres Alvarado on 08/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnSaludar: UIButton!
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var btnSaludarDos: UIButton!
    @IBOutlet weak var lblSaludo: UILabel!
    
    var nameImage = "spiderman"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSaludar.layer.cornerRadius = 15
        btnSaludar.layer.borderWidth = 1
        btnSaludar.layer.borderColor = UIColor.black.cgColor
        
        btnSaludarDos.layer.cornerRadius = 20
        btnSaludarDos.layer.borderWidth = 1
        btnSaludarDos.layer.borderColor = UIColor.red.cgColor
        
        contentImage.image = UIImage(named: "spiderman")
    
    }
    
    @IBAction func tapInBtnSaludar(_ sender: UIButton) {
        
        if nameImage == "spiderman" {
            contentImage.image = UIImage(named: "wolverine")
            nameImage = "wolverine"
        } else {
            contentImage.image = UIImage(named: "spiderman")
            nameImage = "spiderman"
        }
        
    }
    
    
    @IBAction func tapBtnSaludarDos(_ sender: UIButton) {
    
        guard let text = txtName.text else {
            return
        }
        
        if text == "" {
            
            showAlert(message: "Debes escribir un nombre para saludar", title: "Error", isError: true)
            lblSaludo.text = ""
            
        } else {
            
            showAlert(message: "\(text), \(nameImage) te saluda"  , title: "Hola", isError: false)
            lblSaludo.text = "\(text), \(nameImage) te saluda"
            
        }
        
    }
    
    func showAlert(message: String, title: String, isError: Bool) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var styleAlert = UIAlertAction.Style.default
        var titleAction = "OK Gracias"
        
        if isError {
            styleAlert = UIAlertAction.Style.destructive
            titleAction = "Cerrar"
        }
        
        let  closeAction = UIAlertAction(title: titleAction, style: styleAlert, handler: nil)
        alert.addAction(closeAction)
        
        self.present(alert, animated: true)
        
    }
    
}



