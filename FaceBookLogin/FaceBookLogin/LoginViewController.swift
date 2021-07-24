//
//  ViewController.swift
//  FaceBookLogin
//
//  Created by Israel Torres Alvarado on 21/07/21.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let token = AccessToken.current, token.isExpired == false {
            performSegue(withIdentifier: "goToHome", sender: nil)
        }
    }

}

extension LoginViewController: LoginButtonDelegate {
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("se cierra la sesion...")
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        print("Sesion iniciada....")
        
        performSegue(withIdentifier: "goToHome", sender: nil)
        
        guard let token = result?.token else {
            return
        }
        
        getInfoUser(token: token.tokenString)
        
    }
    
    func getInfoUser(token: String) {
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                 parameters: ["field" : "me?fields=id,name,email,picture{url}"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        
        request.start { conn, result, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
        
            if let response = result as? [String: Any] {
                dump(response)
            }
        
        }
        
    }

}
