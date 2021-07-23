//
//  ViewController.swift
//  FaceBookLogin
//
//  Created by Israel Torres Alvarado on 21/07/21.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    lazy var loginButton: FBLoginButton = {
            
        let button = FBLoginButton()
        button.permissions = ["public_profile", "email"]
        button.translatesAutoresizingMaskIntoConstraints = false
        button.delegate = self
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }

}

extension ViewController: LoginButtonDelegate {
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("se cierra la sesion...")
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("Sesion iniciada....")
        
        
        
        
    }
    
}
